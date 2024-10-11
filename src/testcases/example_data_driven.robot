***Settings***
Resource    ${CURDIR}/../imports/import.resource
Resource    ${CURDIR}/../keywords/example_keywords.robot
Test Template    Example-keyword with arguments

*** Variables ***
${my_value_scalar}         hello

***Test Cases***    arg1
Test Variables    ${my_value_scalar}
    [Documentation]    This is a test case with variables