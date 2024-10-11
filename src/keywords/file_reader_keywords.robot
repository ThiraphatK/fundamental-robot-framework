***Settings***
Resource    ../imports/import.resource

***Keywords***  
Read CSV File from Path
    [Arguments]    ${path}
    @{data}=    read csv file to associative    ${path}
    Set Suite Variable    ${data_csv}    ${data}