Feature: Resetting the product form
  As a user who changes their mind
  I want to clear all quantity fields with one action
  So I can reconsider my purchase

Background:
  Given I am browsing the online catalog
  When I click on "Enter GMO OnLine" button

Scenario Outline: Clear all product quantities in the form
  And I populate the product quantities with the following details:
    | product                | input |
    | <product>              | <input> |
  When I press the "Reset" button
  Then all fields should show the default values as below:
    | product                | input |
    | 3 Person Dome Tent     | 0 |
    | External Frame Backpack| 0 |
    | Glacier Sun Glasses    | 0 |
    | Padded Socks           | 0 |
    | Hiking Boots           | 0 |
    | Back Country Shorts    | 0 |

  Examples:
    | product                | input |
    | 3 Person Dome Tent     | 100   |
    | External Frame Backpack| 200   |
    | Glacier Sun Glasses    | 300   |
    | Padded Socks           | 400   |
    | Hiking Boots           | 500   |
    | Back Country Shorts    | 600   |
