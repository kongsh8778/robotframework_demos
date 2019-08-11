*** Test Cases ***
Example
	${str1} =	Catenate	Hello	world	#空格
	${str2} =	Catenate	SEPARATOR=---	Hello	world #---
	${str3} =	Catenate	SEPARATOR=	Hello	world   #=
	log       ${str1}    console=yes
	log       ${str2}    console=yes
	log       ${str3}    console=yes
