*** Settings ***
Library  SeleniumLibrary
Library  Functions.py

*** Variables ***

${TOMORROW_BUTTON_XPATH}                    //*[@class="my-date-interval-arrow" and @data-interval="1"]
${CALENDAR_ID}                              bookingcalform-p_pvm_custom

*** Keywords ***

Find Hour From Tali Tomorrow Between
    [Arguments]    ${start_hour}    ${end_hour}
    Go to    https://varaukset.talintenniskeskus.fi/booking/booking-calendar
    Wait Until Element Is Enabled    ${TOMORROW_BUTTON_XPATH}
    Click Element    ${CALENDAR_ID}
    Click Element    ${TOMORROW_BUTTON_XPATH}
    sleep  1 s
    ${hour_found} =    Set Variable    ${FALSE}
    : FOR    ${INDEX}    IN RANGE    ${startHour}    ${endHour}   
    \    ${start_str_even} =    start hour 2 str    ${INDEX}
    \    ${start_str_half} =    half hour 2 str    ${INDEX}
    \    ${even} =    Run Keyword And Return Status    Page Should Contain Element    //td[@class="s-avail"]/a[contains(text(), "${start_str_even}")]
    \    ${half} =    Run Keyword And Return Status    Page Should Contain Element    //td[@class="s-avail"]/a[contains(text(), "${start_str_half}")]
    \    Run Keyword If    ${even}    Exit For Loop
    \    Run Keyword If    ${half}    Exit For Loop
    Return From Keyword If    ${even}    ${TRUE}
    Return From Keyword If    ${half}    ${TRUE}
    [Return]    ${FALSE}



