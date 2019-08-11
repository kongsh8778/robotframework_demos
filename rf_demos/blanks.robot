*** Test Cases ***
One Space
    Should Be Equal    ${SPACE}    \ \

Four Spaces
    Should Be Equal    ${SPACE * 4}    \ \ \ \ \

Ten Spaces
    Should Be Equal    ${SPACE * 10}    \ \ \ \ \ \ \ \ \ \ \

Quoted Space
    Should Be Equal    "${SPACE}"    " "

Quoted Spaces
    Should Be Equal    "${SPACE * 2}"    " \ "

Empty
    Should Be Equal    ${EMPTY}    \
