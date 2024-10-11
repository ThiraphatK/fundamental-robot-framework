***Settings***
Resource    ${CURDIR}/../imports/import.resource

***Variables***
# scalar variable
${my_value_scalar}         hello
# list
@{my_list}    hello    world
# dictionary
&{my_dict}    key1=value1    key2=value2    key3=123

***Test Cases***
Test Variables
    Log    Hello, world!
    Log    ${my_value_scalar}
    Log    ${my_list[0]}    console=true
    Log    ${my_list[1]}
    Log    ${my_dict}
    Log    ${my_dict['key3']}