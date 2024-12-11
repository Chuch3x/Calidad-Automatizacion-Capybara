require_relative '../pages/objects_page'

After do 
    Capybara.current_session.driver.quit
end

Before '@maximize' do
    page.driver.browser.manage.window.maximize
end

AfterStep('@slow') do
    sleep 1
end
  
Around do |scenario, block|
    puts "Starting the scenario: #{scenario.name}"
    start_time = Time.now
    block.call
    duration = Time.now - start_time
    puts "Scenario completed: #{scenario.name}"
    puts "Scenario duration: #{duration} seconds"
end
  
BeforeAll do
    Capybara.app_host = "https://demo.borland.com/gmopost/"
    puts "<--- Starting the test suite --->\n\n"
end
  
AfterAll do
    puts "\n\n<--- Tests completed --->"
end

After do |scenario|
    puts "Starting the scenario: #{scenario.name}"
end
  
Before do |scenario|
    @page = Page.new
    puts "Scenario started: #{scenario.name}"
  end

