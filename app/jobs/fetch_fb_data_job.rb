class FetchFbDataJob < ApplicationJob
  queue_as :default

  def perform(*args)
    User.all.each do |user|
      next if user.token.blank?
      @graph = Koala::Facebook::API.new(user.token) rescue ""
    	groups = @graph.get_connections 'me', :groups rescue ""
      update_group_data(groups, user) if groups.present?
      groups = user.groups
      groups.each do |group|
        #Note: For fetching feeds From Facebook Requires either admin with granted managed_group pemissions or member
        group_posts = @graph.get_object("#{group['fb_id']}/feed") rescue "" if group.privacy.present? 
        new_records = []
        new_records = update_post_data(group, group_posts) if group_posts.present?
        check_match_send_notification(group, new_records) if new_records.present?
      end
    end
  end
  
  def check_match_send_notification(group, new_records)
    keywords = group.keywords.map(&:keyword)
    new_records.each do |record|
      NotificationJob.set(wait: 8.seconds).perform_now "New post added to #{group.name} with your keyword match" if keywords.any? {|s| record.message.include? s}
    end
  end

  def update_group_data(fb_groups, user)
    fb_groups.each do |fb_group|
      group = Group.find_or_initialize_by(user_id: user.id, name: fb_group['name'],fb_id: fb_group['id'])
      unless group.persisted?
        group.privacy = fb_group['privacy']
        group.save
        puts "--------------- New Group added -- #{fb_group['name']} ---------------"
      end
    end
  end

  def update_post_data(group, fb_posts)
    new_records = []
    fb_posts.each do |fb_post|
      if fb_post['message'].present?
        post = Post.find_or_initialize_by(group_id: group.id, fb_id: fb_post['id'])
        unless post.persisted?
          post.message = fb_post['message'] rescue ""
          post.updated_time = fb_post['updated_time']
          post.save
          new_records << post
          puts "--------------- New Post added -- #{fb_post['message']} ---------------"
        end
      end
    end
    new_records
  end
end
