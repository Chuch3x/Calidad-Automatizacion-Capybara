Given(/^I am at GMO online site$/) do
    visit 'https://demo.borland.com/gmopost/'
end

When('I click the {string} button') do |aboutBtn|
    click_button(aboutBtn)
end

Then(/^I see the list of technologies used for the site$/) do |table|
    technologies = table.raw.flatten # Extrae la lista de tecnologías como un array.
    
    technologies.each do |tech|
      expect(page).to have_content(tech) # Verifica que cada tecnología esté presente en la página.
    end
  end
  