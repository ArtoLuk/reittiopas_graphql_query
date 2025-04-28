*** Settings ***
Library    OperatingSystem
Resource   variables.robot
Resource   keywords.robot

*** Test Cases ***
Verify Route LongName
    ${query}=    Set Variable    {routes(name: "${ROUTE_NAME}") {longName}}
    ${json_response}=    Send GraphQL Query    ${query}
    
    ${longName}=    Evaluate    $json_response["data"]["routes"][0]["longName"]
    Should Be Equal    ${longName}    ${EXPECTED_ROUTE_LONGNAME}

Verify Stop Name
    ${query}=    Set Variable    {stop(id: "${STOP_ID}") {name}}
    ${json_response}=    Send GraphQL Query    ${query}
    
    ${stop_name}=    Evaluate    $json_response["data"]["stop"]["name"]
    Should Be Equal    ${stop_name}    ${EXPECTED_STOP_NAME}


