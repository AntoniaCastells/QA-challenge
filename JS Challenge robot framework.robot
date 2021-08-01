*** Settings ***
Library     SeleniumLibrary
Test Teardown    Close Browser
Documentation     Test validation requirement For positive test(JSQA-019) we expect a successfull message. For negative test(JSQA-019 to JSQA-023) we expect and error message.

*** Variables ***
${browser}    firefox
${homepage}   automationpractice.com/index.php
${scheme}     http
${testUrl}    ${scheme}://${homepage}


*** Keyword ***

Open contact page
    Open Browser    ${testUrl}     ${browser}
    Wait Until Element Is Visible    xpath=//*[@id="contact-link"]/a
    Click Element    xpath=//*[@id="contact-link"]/a
    Wait Until Element Is Visible    xpath=//*[@id="center_column"]/form/fieldset/h3

Select Customer Service in Subject window
    Click Element      xpath=//*[@id="id_contact"]
    Mouse Down      xpath=/html/body/div/div[2]/div/div[3]/div/form/fieldset/div[1]/div[1]/div[1]/div/select/option[2]
    Click Element    xpath=/html/body/div/div[2]/div/div[3]/div/form/fieldset/div[1]/div[1]/div[1]/div/select/option[2]

Enter E-mail address
    [Arguments]       ${Email address}
    Click Element    xpath=//*[@id="email"]
    Input Text    xpath=//*[@id="email"]    ${Email address}

Fill Order Reference
    [Arguments]       ${Order Referece}
    Click Element    xpath=//*[@id="id_order"]
    Input Text    xpath=//*[@id="id_order"]    ${Order Referece}

Fill message window
    [Arguments]       ${message}
    Click Element    xpath=//*[@id="message"]
    Input Text    xpath=//*[@id="message"]    ${message}

Click on send message
    Click Element    xpath=//*[@id="submitMessage"]

*** Test case ***
JSQA-019 Message can be send if all fields are filled and valid
    Open contact page
    Select Customer Service in Subject window
    Enter E-mail address     test@test.com
    Fill Order Reference     123123
    Fill message window      test text
    Click on send message
    Wait Until Element Is Visible     xpath=/html/body/div/div[2]/div/div[3]/div/p

JSQA-020 Subject heading should be selected before sending the message
    Open contact page
    Enter E-mail address     test@test.com
    Fill Order Reference     123123
    Fill message window      test text
    Click on send message
    Wait Until Element Is Visible     xpath=/html/body/div/div[2]/div/div[3]/div/div

JSQA-021 Email address should be validated before sending message
    Open contact page
    Select Customer Service in Subject window
    Enter E-mail address     test@.com
    Fill Order Reference     123123
    Fill message window      test text
    Click on send message
    Wait Until Element Is Visible     xpath=/html/body/div/div[2]/div/div[3]/div/div


JSQA-022 Order Reference Should be validated before sending message
    Open contact page
    Select Customer Service in Subject window
    Enter E-mail address     test@test.com
    Fill Order Reference     \ \ \
    Fill message window      test text
    Click on send message
    Wait Until Element Is Visible     xpath=/html/body/div/div[2]/div/div[3]/div/div


JSQA-023 Message text should be validated before sending message
    Open contact page
    Select Customer Service in Subject window
    Enter E-mail address     test@test.com
    Fill Order Reference     123123
    Fill message window      \ \ \
    Click on send message
    Wait Until Element Is Visible     xpath=/html/body/div/div[2]/div/div[3]/div/div
