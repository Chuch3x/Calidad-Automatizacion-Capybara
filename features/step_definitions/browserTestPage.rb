Given(/^I am on the landing page of GMO$/) do
    visit 'https://demo.borland.com/gmopost/'
end

When('I click the button {string}') do |testButton|
    click_button(testButton)
end

Then(/^I see the list of compatible browsers$/) do |table|
    technologies = table.raw.flatten
    technologies.each do |tech|
      if tech == "Definition Text Style (should be an italic font)"
        expect(page).to have_css('dfn', text: 'Definition Text Style')
        expect(page).to have_content('(should be an italic font)')
      else
        expect(page).to have_content(tech)
      end
    end
  end
  