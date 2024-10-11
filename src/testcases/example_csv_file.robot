***Settings***
Resource    ${CURDIR}/../imports/import.resource
Resource    ${CURDIR}/../keywords/file_reader_keywords.robot
Resource    ${CURDIR}/../keywords/website_keywords.robot
Variables   ${CURDIR}/../testdata/website_testdata.yaml
Test Template    Login to website
Suite Setup    Read CSV File from Path    ${CURDIR}/../testdata/testdata.csv

***Test Cases***
Login to website success        data=${saucedemo}    user_name=${data_csv[0]['username']}    password=${data_csv[0]['password']}    browser=${chrome_brower}
Login to website failed         data=${saucedemo}    user_name=${data_csv[1]['username']}    password=${data_csv[1]['password']}    browser=${chrome_brower}
Login to website problem        data=${saucedemo}    user_name=${data_csv[2]['username']}    password=${data_csv[2]['password']}    browser=${chrome_brower}
Login to website performance    data=${saucedemo}    user_name=${data_csv[3]['username']}    password=${data_csv[3]['password']}    browser=${chrome_brower}