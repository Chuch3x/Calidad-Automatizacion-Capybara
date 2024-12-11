class SiteInformation
    include Capybara::DSL
    include RSpec::Matchers
  
    def verify_technologies(table)
      technologies = table.raw.flatten
      technologies.each do |tech|
        expect(page).to have_content(tech)
      end
    end
  end