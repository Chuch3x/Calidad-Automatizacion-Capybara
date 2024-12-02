Feature:  
    As an online shopper i want to access to a product so
    I want to test if it works in different browsers,
    so I have confidence when using the site.

‌@maximize
Scenario: Look for the browser test page of the site
    Given I am at the landing page of GMO
    When I click the button "Browser Test Page" 
    Then I see the list of compatible browsers
        | Internet Explorer 3.0 |
        | Blinking Text |
        | dot bullets |
        | circle bullets |
        | square bullets |
        | Netscape Navigator 3.0 |
        | Colored Horizontal Rules |
        | Definition Text Style (should be an italic font) |
        | Trademarks are important |
        | Table Properties|