*** Settings ***
Resource    ../resource/stepdefn/stepdefn.resource


*** Test Cases ***
GherkinsTest
    Given I have launched Big Basket application
    When I click open navigation
    Then I validate the test