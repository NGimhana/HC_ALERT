Feature: Transfer In

  @PT-1843 @MVP @AUTOMATED
  Scenario: Verify Container details in Transfer In Confirmation - Via Expected Transfer In list
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Dispatch" icon button
    And user presses "Transfer Out" icon button
    And "Select Transfer Out" page is shown
    And user presses "Requested" button and "Select Transfer Request" page shown
    And user presses "Ad-hoc" button and "Transfer Out Data Capture" page shown
    And user presses "Select Destination Location" icon button
    And "Select Transfer Out Location" page is shown
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    When user presses "Select Reason" icon button
    And "Select Transfer Out Reason" page is shown
    And user selects "Overstocked" from "Reason List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    And user presses "Edit Items" button and "Transfer Out Items" page shown
    And user presses "Add Container" button and "Transfer Out Containers" page shown
    And user presses "Add" button and "Add Containers" page shown
    And user enters "${Container 4 Id}" into "Container ID" field
    And user presses "Edit Items" button and "Container Items" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Add Item" page shown
    Then user enters "5" into "Enter Quantity" field
    And user presses "Add" button and "Container Items" page shown
    And user presses "Done" button and "Transfer Out Items" page shown
    And user presses "Cancel" button and "Void Transfer" page shown
    And user presses "OK" button and "Administration Screen" page shown
    And user presses "Administration Screen Back Button" icon button
    And user presses "Receive" icon button
    And user presses "Terminal Cash Management Transfer In Button" icon button
    And "Unsubmited Transfer In" page is shown
    And user presses "Expected" button and "Expected Transfer In Select Delivery" page shown
    And user presses "Select" button and "Transfer In Summary" page shown
    And user presses "Continue" button and "Transfer In Confirmation" page shown
    And "1" is displayed in "Transfer In Confirmation Details" list
    And user presses "Cancel" button and "Transfer In Void" page shown
    And user presses "OK" button and "Administration Screen" page shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1845 @MVP @AUTOMATED
  Scenario: Verify whether the user can confirm a Transfer In when Container details are available - via Expected Transfer In list
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Dispatch" icon button
    And user presses "Transfer Out" icon button
    And "Select Transfer Out" page is shown
    And user presses "Requested" button and "Select Transfer Request" page shown
    And user presses "Ad-hoc" button and "Transfer Out Data Capture" page shown
    And user presses "Select Destination Location" icon button
    And "Select Transfer Out Location" page is shown
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    When user presses "Select Reason" icon button
    And "Select Transfer Out Reason" page is shown
    And user selects "Overstocked" from "Reason List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    And user presses "Edit Items" button and "Transfer Out Items" page shown
    And user presses "Add Container" button and "Transfer Out Containers" page shown
    And user presses "Add" button and "Add Containers" page shown
    And user enters "${Container 5 Id}" into "Container ID" field
    And user presses "Edit Items" button and "Container Items" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Add Item" page shown
    Then user enters "5" into "Enter Quantity" field
    And user presses "Add" button and "Container Items" page shown
    And user presses "Done" button and "Transfer Out Items" page shown
    And user presses "Cancel" button and "Void Transfer" page shown
    And user presses "OK" button and "Administration Screen" page shown
    And user presses "Administration Screen Back Button" icon button
    And user presses "Receive" icon button
    And user presses "Terminal Cash Management Transfer In Button" icon button
    And "Unsubmited Transfer In" page is shown
    And user presses "Expected" button and "Expected Transfer In Select Delivery" page shown
    And user presses "Select" button and "Transfer In Summary" page shown
    And user presses "Continue" button and "Transfer In Confirmation" page shown
    And user presses "Confirm" button and "Transfer In Confirm" page shown
    And user presses "OK" button and "Administration Screen" page shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1846 @MVP @AUTOMATED
  Scenario: Verify "Containers Only" checkbox in "Items" screen - via Expected Transfer In list
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Dispatch" icon button
    And user presses "Transfer Out" icon button
    And "Select Transfer Out" page is shown
    And user presses "Requested" button and "Select Transfer Request" page shown
    And user presses "Ad-hoc" button and "Transfer Out Data Capture" page shown
    And user presses "Select Destination Location" icon button
    And "Select Transfer Out Location" page is shown
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    When user presses "Select Reason" icon button
    And "Select Transfer Out Reason" page is shown
    And user selects "Overstocked" from "Reason List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    And user presses "Edit Items" button and "Transfer Out Items" page shown
    And user presses "Add Container" button and "Transfer Out Containers" page shown
    And user presses "Add" button and "Add Containers" page shown
    And user enters "${Container 6 Id}" into "Container ID" field
    And user presses "Edit Items" button and "Container Items" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Add Item" page shown
    Then user enters "5" into "Enter Quantity" field
    And user presses "Add" button and "Container Items" page shown
    And user presses "Done" button and "Transfer Out Items" page shown
    And user presses "Cancel" button and "Void Transfer" page shown
    And user presses "OK" button and "Administration Screen" page shown
    And user presses "Administration Screen Back Button" icon button
    And user presses "Receive" icon button
    And user presses "Terminal Cash Management Transfer In Button" icon button
    And "Unsubmited Transfer In" page is shown
    And user presses "Expected" button and "Expected Transfer In Select Delivery" page shown
    And user presses "Select" button and "Transfer In Summary" page shown
    And user presses "Edit Items" button and "Transfer In Edit Items" page shown
    And "1" is displayed in "Transfer In Edit Field" list
    And "5" is displayed in "Transfer In Edit Field" list
    And "5" is displayed in "Transfer In Edit Field" list
    And user presses "Cancel" button and "Administration Screen" page shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1855 @MVP @AUTOMATED
  Scenario: Verify "Verify Container" button in Items screen - via Expected Transfer In list
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Dispatch" icon button
    And user presses "Transfer Out" icon button
    And "Select Transfer Out" page is shown
    And user presses "Requested" button and "Select Transfer Request" page shown
    And user presses "Ad-hoc" button and "Transfer Out Data Capture" page shown
    And user presses "Select Destination Location" icon button
    And "Select Transfer Out Location" page is shown
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    When user presses "Select Reason" icon button
    And "Select Transfer Out Reason" page is shown
    And user selects "Overstocked" from "Reason List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    And user presses "Edit Items" button and "Transfer Out Items" page shown
    And user presses "Add Container" button and "Transfer Out Containers" page shown
    And user presses "Add" button and "Add Containers" page shown
    And user enters "${Container 7 Id}" into "Container ID" field
    And user presses "Edit Items" button and "Container Items" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Add Item" page shown
    Then user enters "5" into "Enter Quantity" field
    And user presses "Add" button and "Container Items" page shown
    And user presses "Done" button and "Transfer Out Items" page shown
    And user presses "Cancel" button and "Void Transfer" page shown
    And user presses "OK" button and "Administration Screen" page shown
    And user presses "Administration Screen Back Button" icon button
    And user presses "Receive" icon button
    And user presses "Terminal Cash Management Transfer In Button" icon button
    And "Unsubmited Transfer In" page is shown
    And user presses "Expected" button and "Expected Transfer In Select Delivery" page shown
    And user presses "Select" button and "Transfer In Summary" page shown
    And user presses "Edit Items" button and "Transfer In Edit Items" page shown
    And user presses "Verify Container" button and "Transfer In Verify Container" page shown
    And "2" is displayed in "Items List" list
    And "HD Complexion Starter Kit" is displayed in "Items List" list
    And "5" is displayed in "Items List" list
    And "5" is displayed in "Items List" list
    And user presses "Back" button and "Transfer In Edit Items" page shown
    And user presses "Cancel" button and "Administration Screen" page shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1856 @MVP @AUTOMATED
  Scenario: Verify a Transfer In confirmation when add a new container through POS - via Expected Transfer In list
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Dispatch" icon button
    And user presses "Transfer Out" icon button
    And "Select Transfer Out" page is shown
    And user presses "Requested" button and "Select Transfer Request" page shown
    And user presses "Ad-hoc" button and "Transfer Out Data Capture" page shown
    And user presses "Select Destination Location" icon button
    And "Select Transfer Out Location" page is shown
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    When user presses "Select Reason" icon button
    And "Select Transfer Out Reason" page is shown
    And user selects "Overstocked" from "Reason List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    And user presses "Edit Items" button and "Transfer Out Items" page shown
    And user presses "Add Container" button and "Transfer Out Containers" page shown
    And user presses "Add" button and "Add Containers" page shown
    And user enters "${Container 8 Id}" into "Container ID" field
    And user presses "Edit Items" button and "Container Items" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Add Item" page shown
    Then user enters "5" into "Enter Quantity" field
    And user presses "Add" button and "Container Items" page shown
    And user presses "Done" button and "Transfer Out Items" page shown
    And user presses "Cancel" button and "Void Transfer" page shown
    And user presses "OK" button and "Administration Screen" page shown
    And user presses "Administration Screen Back Button" icon button
    And user presses "Receive" icon button
    And user presses "Terminal Cash Management Transfer In Button" icon button
    And "Unsubmited Transfer In" page is shown
    And user presses "Expected" button and "Expected Transfer In Select Delivery" page shown
    And user presses "Select" button and "Transfer In Summary" page shown
    And user presses "Edit Items" button and "Transfer In Edit Items" page shown
    And "1" is displayed in "Transfer In Edit Field" list
    And "5" is displayed in "Transfer In Edit Field" list
    And "5" is displayed in "Transfer In Edit Field" list
    And user presses "Add Container" button and "Transfer In Container" page shown
    And user presses "Add" button and "Transfer In Add Container" page shown
    And user enters "119" into "Transfer In Container Id Field" field
    And user presses "Edit Items" button and "Transfer In Container Items" page shown
    And user enters "2" into "Input Box" field
    And user presses "ENT" button and "Transfer In Edit Quantity Enter Items" page shown
    And user enters "4" into "Transfer In Quantity Field" field
    And user presses "Update" button and "Transfer In Container Items" page shown
    And user presses "Done" button and "Transfer In Edit Items" page shown
    And "119 (119)" is displayed in "Transfer In Edit Field" list
    And "0" is displayed in "Transfer In Edit Field" list
    And "0" is displayed in "Transfer In Edit Field" list
    And "0" is displayed in "Transfer In Edit Field" list
    And user presses "Done" button and "Transfer In Summary" page shown
    And user presses "Continue" button and "Transfer In Transfer" page shown
    And user presses "OK" button and "Transfer In Confirmation" page shown
    And user presses "Confirm" button and "Transfer In Confirm" page shown
    And user presses "OK" button and "Administration Screen" page shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1857 @MVP @AUTOMATED
  Scenario: Verify whether the user can proceed an unsubmitted Transfer In when container is available
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Receive" icon button
    And user presses "Transfer In" icon button
    And "Select Receipt Prompt" page is shown
    And user presses "Expected" button and "Select Delivery" page shown
    And user presses "Select" button and "Delivery Header Summary" page shown
    And user presses "Continue" button and "Transfer Summary" page shown
    When user presses "Cancel" button and "Confirm Void" page shown
    Then user presses "OK" button and "Administration Screen" page shown
    And user presses "Transfer In" icon button
    And "Select Receipt Prompt" page is shown
    #select the dispatch ID
    And user selects "Dispatch ID" from "Reason List" list
    And user presses "Select" button and "Delivery Header Summary" page shown
    And user presses "Continue" button and "Transfer Summary" page shown
    And "${SKU Product 6}" is displayed in "Transfer In Confirmation List" list
    And "${SKU Product 6 Description}" is displayed in "Transfer In Confirmation List" list
    And user presses "Confirm" button and "Confirm Submit" page shown
    And user presses "OK" button and "Administration Screen" page shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
