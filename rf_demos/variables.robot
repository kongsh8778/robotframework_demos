*** Variables ***
${NAME}           robot framework
${VERSION}        3.1
${CONN}           ${NAME} + ${VERSION}

*** Test Cases ***
scalar
    log    ${NAME}
    log    ${VERSION}
    log    ${CONN}