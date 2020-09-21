require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.every '2m' do
  puts 'started!!!'
  FetchFbDataJob.perform_now
  puts 'completed..!'
end
