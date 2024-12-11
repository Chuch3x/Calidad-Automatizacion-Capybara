class BrowserTest
  include Capybara::DSL
  include RSpec::Matchers

  def click_button_on_page(button_text)
    click_button(button_text)
  end

  def verify_technologies(table)
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
end