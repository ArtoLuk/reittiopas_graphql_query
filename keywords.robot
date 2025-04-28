*** Settings ***
Library    RequestsLibrary
Library    Collections

Resource    variables.robot

*** Keywords ***
Create GraphQL Headers
    ${headers}=    Create Dictionary
    ...    Content-Type=application/graphql
    ...    digitransit-subscription-key=${API_KEY}
    RETURN    ${headers}

Send GraphQL Query
    [Arguments]    ${query}
    ${headers}=    Create GraphQL Headers
    ${response}=    POST    ${ENDPOINT_URL}
    ...    headers=${headers}
    ...    data=${query}

    Should Be Equal As Strings    ${response.status_code}    200

    ${json}=    Set Variable    ${response.json()}
    RETURN    ${json}