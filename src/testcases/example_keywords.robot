***Settings***
Resource    ${CURDIR}/../imports/import.resource
Resource    ${CURDIR}/../keywords/example_keywords.robot

*** Variables ***
${my_value_scalar}         hello

***Test Cases***
Test Variables
    [Documentation]    This is a test case with variables
    Example-keyword
    Example-keyword with arguments    ${my_value_scalar} 

Test tag1
    [Tags]    tag1
    [Documentation]    This is a test case with a tag1
    Example-keyword

Test tag2
    [Tags]    tag2
    [Documentation]    This is a test case with a tag2
    Example-keyword