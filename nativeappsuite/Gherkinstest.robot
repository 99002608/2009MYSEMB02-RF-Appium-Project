*** Settings ***
Documentation    This file covers the test cases for validating Gherkins Test

Resource    ../resource/stepdefn/stepdefn.resource


*** Test Cases ***
GherkinsTest
    Given I have launched Big Basket application
    When I click open navigation
    When I click shop by category as "Smart Basket"
    When I click on adding and removing items
    Then I validate the test