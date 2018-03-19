class AbhishekWorker
  include Sidekiq::Worker

  def perform(*args)
    # Do something
    puts "This is newsletter!"
    sleep  4
  end
end
