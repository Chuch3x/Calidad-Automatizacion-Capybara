class LandingPage
    include Capybara::DSL
  
    def visit_landing_page
      visit 'https://demo.borland.com/gmopost/'
    end
  end
  