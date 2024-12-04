Feature: As an online shopper
  I want to get an error when I fill in some field incorrectly
  So I can't continue with my purchase if something is wrong

Background:
  Given I am at the landing page of GMO
  When I click the button "Enter GMO OnLine"

@maximize
Scenario Outline: Fill the quantity input with letters
  And I write "<input>" in the input box of the product "<product>"
  When I click the button "Place An Order"
  Then I receive a notification "Please enter only digits in this field."
  Examples:
    | product                | input | 
    | 3 Person Dome Tent     | dos   |
    | External Frame Backpack| tres  |
    | Glacier Sun Glasses    | siete   |

@maximize
Scenario Outline: Fill the quantity input with strange characters
  And I write "<input>" in the input box of the product "<product>"
  When I click the button "Place An Order"
  Then I receive a notification "Please enter only digits in this field."

  Examples:
    | product                | input | 
    | 3 Person Dome Tent     | ***   |
    | External Frame Backpack| &     |
    | Glacier Sun Glasses    | /&#   |
    | Padded Socks           | @!#   |
    | Hiking Boots           | $     |
    | Back Country Shorts    | "%#   |

@maximize
Scenario Outline: Fill the quantity input with decimals
  And I write "<input>" in the input box of the product "<product>"
  When I click the button "Place An Order"
  Then I receive a notification "Please enter only digits in this field."

  Examples:
    | product                | input | 
    | 3 Person Dome Tent     | 2.2   |
    | External Frame Backpack| 4.21  |
    | Glacier Sun Glasses    | 32.12 |
    | Padded Socks           | 123.12|
    | Hiking Boots           | 34.1  |
    | Back Country Shorts    | 0.01  |


@maximize
Scenario Outline: Fill the quantity input with empty spaces
  And I write the quantities for the products as the table below:
    | product                | input | 
    | 3 Person Dome Tent     |    |
    | External Frame Backpack|    |
    | Glacier Sun Glasses    |    |
    | Padded Socks           |    |
    | Hiking Boots           |    |
    | Back Country Shorts    |    |
  When I click the button "Place An Order"
  Then I receive a notification "Please Order Something First"

@maximize
Scenario Outline: Fill the quantity input with decimals
  And I write "<input>" in the input box of the product "<product>"
  When I click the button "Place An Order"
  Then I receive a notification "Please enter only digits in this field."
  Examples:
    | product                | input | 
    | 3 Person Dome Tent     | -111   |
    | External Frame Backpack| -1   |
    | Glacier Sun Glasses    | -32 |
    | Padded Socks           | -1243   |
    | Hiking Boots           | -654  |
    | Back Country Shorts    | -3451   |
