*** Settings ***
Resource    tali_resources.robot
Test Teardown  Close all browsers

*** Variables ***
${start_hour}                            14
${end_hour}                              21


*** Test Cases ***

Find Hour Tomorrow
    ${tali_found} =    Find Hour From Tali Tomorrow Between    ${start_hour}    ${end_hour}


