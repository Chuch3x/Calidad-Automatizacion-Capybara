Feature:  
    As an online shopper i want to access to a product so I 
    I want to know how the page was made,
    so I have confidence when using the site.

‌@maximize
Scenario: Look for the information of the site
    Given I am at the landing page of GMO
    When I click the button "About The GMO Site"
    Then I see the list of technologies used for the site
    
        | HTML 3.2 |
        | HTML Browser Extensions |
        | Animation |
        | JavaScript |
        | CGI |
        | Java |
        | ActiveX |
        | Client-side processes |
        | Server-side processes |
        | Style sheets|
        | Multimedia |
        | VBscript |
        | Plug-Ins |
        | IIOP |
        | Cookies |
        | Secure transactions |
        | Database access |