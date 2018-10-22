*** Settings ***
Library  SeleniumLibrary
Library  Functions.py

*** Variables ***

${TOMORROW_BUTTON_XPATH}                    //*[@class="my-date-interval-arrow" and @data-interval="1"]
${CALENDAR_ID}                              bookingcalform-p_pvm_custom

*** Keywords ***

Find Hour From Tali Tomorrow Between
    [Arguments]    ${start_hour}    ${end_hour}
    Open browser    https://varaukset.talintenniskeskus.fi/booking/booking-calendar  chrome
    Wait Until Element Is Enabled    ${TOMORROW_BUTTON_XPATH}
    Click Element    ${CALENDAR_ID}
    Click Element    ${TOMORROW_BUTTON_XPATH}
    ${hour_found} =    Set Variable    ${FALSE}
    : FOR    ${INDEX}    IN RANGE    ${startHour}    ${endHour}   
    \    ${start_str_even} =    start hour 2 str    ${INDEX}
    \    ${start_str_half} =    half hour 2 str    ${INDEX}
    \    ${even} =    Run Keyword And Return Status    Page Should Contain Element    //td[@class="s-avail"]/a[contains(text(), "${start_str_even}")]
    \    ${half} =    Run Keyword And Return Status    Page Should Contain Element    //td[@class="s-avail"]/a[contains(text(), "${start_str_half}")]
    \    Run Keyword If    ${even}    Exit For Loop
    \    Run Keyword If    ${half}    Exit For Loop
    ${hour_found} =    Run Keyword If    ${even}    Set Variable    ${TRUE}
    ${hour_found} =    Run Keyword If    ${half}    Set Variable    ${TRUE}
    [Return]    ${hour_found}


