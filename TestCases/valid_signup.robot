*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid Sign up
    Open Browser To Home Page
    Sign Up process
    Submit Sign Up
    Account Page Should Be Open

    [Teardown]    Close Browser


