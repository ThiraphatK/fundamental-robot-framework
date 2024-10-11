***Settings***
Resource    ${CURDIR}/../imports/import.resource
Resource    ${CURDIR}/../keywords/example_keywords.robot
Variables   ${CURDIR}/../testdata/testdata.yaml

***Test Cases***
Test cases1
    Example-keyword
    Example-keyword with arguments    ${testdata1.name}
    Example-keyword with arguments    ${testdata1.age} 

Test cases2
    Example-keyword
    Example-keyword with arguments    ${testdata2[0]['name']}
    Example-keyword with arguments    ${testdata2[1]['name']} 

Test cases3
    Example-keyword
    Example-keyword with arguments    ${testdata3[0]['name']}
    Example-keyword with arguments    ${testdata3[0]['age']} 
    Example-keyword with arguments    ${testdata3[1]['name']}
    Example-keyword with arguments    ${testdata3[1]['age']} 