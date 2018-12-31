//Test plateau

func TestgetPos () -> Bool {
	plat : PlateauProtocol
	plat.init()
	var ok : Bool
	do {
		try plat.getPos(x : 0, y : 0)
		try plat.getPos(x : -3, y : 2)
		try plat.getPos(x : 4, y : 1)
		print("plateau get Pos PAS ok (precond)")
		ok = false
	}

	catch {
		print("plateau get Pos ok (precond)")
		ok = true
	}

	return ok
}