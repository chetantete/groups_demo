require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

# scheduler.every '5m' do
scheduler.every '2h' do
	puts 'started!!!'
	FetchFbDataJob.perform_now
  puts 'completed..!'
end
