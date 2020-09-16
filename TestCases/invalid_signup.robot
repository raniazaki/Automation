*** Settings ***
Documentation     A test suite containing tests related to invalid login.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.
Suite Setup       Open Browser To Home Page
Test Setup        Go To Signup Page
Resource          resource.robot

*** Test Cases ***
Invalid Signup
    Invalid Sign up process
    [Teardown]    Close Browser

