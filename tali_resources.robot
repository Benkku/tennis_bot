*** Settings ***
Library  SeleniumLibrary
Library  Functions.py

*** Variables ***

${TOMORROW_BUTTON_XPATH}                    //*[@class="my-date-interval-arrow" and @data-interval="1"]
${CALENDAR_ID}                              bookingcalform-p_pvm_custom

*** Keywords ***

Find Hour From Tali Tomorrow Between
    [Arguments]    ${start_hour}    ${end_hour}    ${day_list}
    Go to    https://varaukset.talintenniskeskus.fi/booking/booking-calendar
    Wait Until Element Is Enabled    ${TOMORROW_BUTTON_XPATH}
    FOR    ${day}    IN    @{day_list}
        Click Element    ${CALENDAR_ID}
        Wait Until Element Is Enabled    //td[text()='${day}']
        Click Element    //td[(@class='day' or @class='new day') and text()='${day}']
        sleep  1 s
        ${hour_found} =    Set Variable    ${FALSE}
        ${even}    ${half} =    Find From Day    ${start_hour}    ${end_hour}
        Run Keyword If    ${even}    LOG    day=${day}
        Run Keyword If    ${even}    Exit For Loop
        Run Keyword If    ${half}    LOG    day=${day}
        Run Keyword If    ${half}    Exit For Loop
    END
    Return From Keyword If    ${even}    ${TRUE}
    Return From Keyword If    ${half}    ${TRUE}
    [Return]    ${FALSE}

Find From Day
    [Arguments]    ${start_hour}    ${end_hour}
    FOR    ${index}    IN RANGE    ${startHour}    ${endHour}
            ${start_str_even} =    start hour 2 str    ${index}
            ${start_str_half} =    half hour 2 str    ${index}
            ${even} =    Run Keyword And Return Status    Page Should Contain Element    //td[@class="s-avail"]/a[contains(text(), "${start_str_even}")]
            ${half} =    Run Keyword And Return Status    Page Should Contain Element    //td[@class="s-avail"]/a[contains(text(), "${start_str_half}")]
            Run Keyword If    ${even}    LOG    ${start_str_even}
            Run Keyword If    ${even}    Exit For Loop
            Run Keyword If    ${half}    LOG    ${start_str_half}
            Run Keyword If    ${half}    Exit For Loop
    END
    [Return]    ${even}    ${half}

