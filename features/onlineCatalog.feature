Feature: As a customer who wants to buy some products
  I want to access the GMO store
  so I can see the list of available products

Background:
  Given I am at the landing page of GMO
  When I click the button "Enter GMO OnLine"

@maximize
Scenario Outline: Look for a product in the GMO store
  Then I see a list of the available products
    | 3 Person Dome Tent      |
    | External Frame Backpack |
    | Glacier Sun Glasses     |
    | Padded Socks            |
    | Hiking Boots            |
    | Back Country Shorts     |
