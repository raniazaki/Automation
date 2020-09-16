*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary
Library           String
Library           BuiltIn


*** Variables ***
${SERVER}         https://www.phptravels.net/
${BROWSER}        Firefox
${DELAY}          1s
${SIGNUP URL}       ${SERVER}/register
${Account URL}    ${SERVER}/account
*** Keywords ***
Open Browser To Home Page
    Open Browser    ${SERVER}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Click Element  xpath://div[@class='dropdown dropdown-login dropdown-tab']//a[@id='dropdownCurrency']
    Mouse Down    xpath://a[@class='dropdown-item tr']
    Click Element  xpath://a[@class='dropdown-item tr']
    Register Page Should Be Open

Register Page Should Be Open
    Title Should Be    Register

Go To Signup Page
    Go To    ${SIGNUP URL}
    Register Page Should Be Open


Input FN
    ${FN}   Generate Random String  1  [UPPER]
    ${FN1}   Generate Random String  4  [LOWER]
    set global variable     ${FN1}
    ${FN2}   CATENATE   ${FN}${FN1}
    set global variable     ${FN2}
    Input Text  xpath://div[@id='login']//div[1]//div[1]//label[1]//input[1]    ${FN2}

Input WrongFN
    ${LFN}   Generate Random String  5  [LOWER]
    set global variable     ${LFN}
    Input Text  xpath://div[@id='login']//div[1]//div[1]//label[1]//input[1]    ${LFN}


Input LN
    ${LN}   Generate Random String  1  [UPPER]
    ${LN1}   Generate Random String  4  [LOWER]
    ${LN2}   CATENATE   ${LN}${LN1}
    set global variable     ${LN}
    set global variable     ${LN2}
    Input Text  xpath://*[@id="headersignupform"]/div[3]/div[2]/div/label/input   ${LN2}

Input WrongLN
    ${LLN}   Generate Random String  5  [LOWER]
    set global variable     ${LLN}
    Input Text  xpath://*[@id="headersignupform"]/div[3]/div[2]/div/label/input   ${LLN}

Input email
    ${email}    CATENATE   SEPARATOR=.  ${FN2}   ${LN}@gmail.com
    Input Text  xpath://div[5]//label[1]//input[1]  ${email}

Input Wemail
    ${email}    CATENATE   SEPARATOR=.  ${LFN}   ${LLN}@gmail.com
    Input Text  xpath://div[5]//label[1]//input[1]  ${email}

Input mobile
    ${mobile1}    Generate Random String  7  [NUMBERS]
    ${mobile}   CATENATE    010${mobile1}
    Input Text  xpath://div[4]//label[1]//input[1]  ${mobile}

Input Password
    ${password}    Generate Random String  8  [LETTERS][NUMBERS]
    set global variable     ${password}
    Input Text  xpath://div[6]//label[1]//input[1]  ${password}
    Input Text  xpath://div[7]//label[1]//input[1]  ${password}

Input wrong password
    ${password1}    Generate Random String  10  [LETTERS][NUMBERS]
    set global variable     ${password1}
    Input Text  xpath://div[6]//label[1]//input[1]  ${password1}
    Input Text  xpath://div[7]//label[1]//input[1]  ${password1}


Sign Up process
    Input FN
    Input LN
    Input mobile
    Input email
    Input Password
    should not be equal     ${LN2}  ${FN2}

Invalid Sign up process
    Input WrongFN
    Input WrongLN
    Input mobile
    Input Wemail
    Input wrong password
    Click Button    Sign Up
    Go To   ${Account URL}
    element should not contain  tag:h3   ${LLN}

Submit Sign Up
    Click Button    Sign Up

Account Page Should Be Open
    Go To   ${Account URL}
    element should contain   tag:h3     ${FN2}
