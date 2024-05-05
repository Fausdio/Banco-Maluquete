function dbstart

LOCAL aStruct := {{"Saldo", "N", 15, 2}} 

IF .NOT. file ("cc.dbf")
dbcreate("cc" , aStruct)
ENDIF

return nil