Number setSlot("/::", Number getSlot("/"))
OperatorTable addOperator("/::", 1)
Number / := method(n, if(n == 0, "devide by 0" println; 0, self /::(n)))

100 / 0
100 / 10