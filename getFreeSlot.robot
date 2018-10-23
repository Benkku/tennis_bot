*** Settings ***
Resource    tali_resources.robot
Test Teardown  Close all browsers

*** Variables ***
${start_hour}                            14
${end_hour}                              21

${poll_interval}                         1 s
${loop_until}                            3

*** Test Cases ***

Find Hour Tomorrow
    Open browser    https://varaukset.talintenniskeskus.fi/booking/booking-calendar  chrome
    :FOR    ${i}    IN RANGE    ${loop_until}
    \    ${tali_found} =    Find Hour From Tali Tomorrow Between    ${start_hour}    ${end_hour}
    \    Exit For Loop If    ${tali_found}
    \    Sleep    ${poll_interval}

