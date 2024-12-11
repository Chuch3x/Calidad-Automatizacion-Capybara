class Page
    def landing_page
      LandingPage.new
    end
  
    def browser_test_page
      BrowserTest.new
    end
    def site_information_page
        SiteInformation.new  
    end
    def detail_place_order_page
        DetailPlaceOrderPage.new
    end
    def detail_product_page
        DetailProductPage.new
    end
  end