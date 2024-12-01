Feature: As an online customer
  I want to copy the data from the bill form to the ship form
  So I can finish the form faster

Background:
  Given I am at the landing page of GMO
  When I click the button "Enter GMO OnLine"

@maximize
Scenario Outline: Fill the form with data to be copied in the shipping form
  And I write "<quantity>" in the input box of the product "<product>"
  When I click the button "Place An Order"
  And I see the summary of my purchase
  When I click the button "Proceed With Order"
  And I fill the form with the following data:
    | Name        | Cesar Mendez       |
    | Address     | 123 MM Marquez     |
    | City        | Cochabamba         |
    | State       | CBBA               |
    | Zip         | 0000               |
    | Phone       | 123-1234           |
    | E-mail      | cesar@example.com  |
    | Card Type   | American Express   |
    | Card Number | 631000537828224    |
    | Expiration  | 12/28              |
  When I check the option to ship the order to the same person
  Then I see the following table in the Ship to form:
    | Name        | Cesar Mendez       |
    | Address     | 123 MM Marquez     |
    | City        | Cochabamba         |
    | State       | CBBA               |
    | Zip         | 0000               |
Examples:
    | product                | quantity | 
    | 3 Person Dome Tent     | 2   |