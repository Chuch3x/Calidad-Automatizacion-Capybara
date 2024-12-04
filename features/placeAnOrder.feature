Feature: As an online shopper 
  I want to fill the billing form 
  so I can place my order successfully

Background:
  Given I am at the landing page of GMO
  When I click the button "Enter GMO OnLine"
  And I write the quantities for the products as the table below:
    | product                | input |   
    | 3 Person Dome Tent     | 3     | 
    | External Frame Backpack| 4     |  
    | Glacier Sun Glasses    | 9     |  
    | Hiking Boots           | 9     |  
  And I click the button "Place An Order"
  And I click the button "Proceed With Order"

@maximize
Scenario: See the Billing Information Form
  Then I see a form on the left side of the screen with the following fields:
    | Name        |
    | Address     |
    | City        |
    | State       |
    | Zip         |
    | Phone       |
    | E-mail      |
    | Credit Card |
    | Card Number |
    | Expiration  |

@maximize
Scenario: Fill out the Billing form correctly with American Express card
  Given I fill the form with the following data:
    | Name        | Pepito             |
    | Address     | Perez              |
    | City        | Cochabamba         |
    | State       | Cochabamba         |
    | Zip         | 33126              |
    | Phone       | 123-123-1234       |
    | E-mail      | pepito@borland.com |
    | Card Type   | American Express   |
    | Card Number | 1234-123456-12345  |
    | Expiration  | 11/26              |
  And I check the option "Ship To: Same as 'Bill To'"
  When I click the button "Place The Order"
  Then I see the "OnLine Store Receipt"

@maximize
Scenario Outline: Fill the form inputs with none values
  Given I leave the field <Field> empty
  When I click the button "Place The Order"
  Then I see a pop-up with the warning "This is a required field."

  Examples:
    | Field       |
    | Name        |
    | Address     |
    | City        |
    | State       |
    | Zip         |
    | Phone       |
    | E-mail      |
    | Card Number |
    | Expiration  |
