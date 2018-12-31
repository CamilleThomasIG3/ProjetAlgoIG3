// Test Jeu 

func TestgetPiece () -> Bool {
	je : JeuProtocol
	je.init()
	var ok : Bool
	if (je.getPiece(x: -1,y: -1, b:true) is vide) {
		do {
			try je.getPiece(x : 3, y : 2, b: false)
			try je.getPiece(x : -3, y : 3, b: false)
			try je.getPiece(x: 1, y:1, b : true)
			print("plateau get Pos PAS ok (precond)")
			ok = false
		}

		catch {
			print("plateau get Pos ok (precond)")
			ok = true
		}
	}
	return ok
}

func TestestOccupeeAllie () -> Bool {
	je : JeuProtocol
	je.init()
	positiontest1(x: -1, y: -1, b: false)
	positiontest2(x: 2, y: 4, b: true)
	positiontest3(x: 0, y: 5, b: false)

	var ok : Bool
	if (je.estOccupeeAllie(positiontest1, joueur :1)==false && je.estOccupeeAllie(positiontest2, joueur :1)==true
		&& je.estOccupeeAllie(positiontest3, joueur :1)==false){
			ok = true
	}

	return ok
}

func TestestOccupeeEnnemi () -> Bool {
	je : JeuProtocol
	je.init()
	positiontest1(x: -1, y: -1, b: false)
	positiontest2(x: 1, y: 1, b: true)
	positiontest3(x: 0, y: 5, b: false)

	var ok : Bool
	if (je.estOccupeeAllie(positiontest1, joueur :1)==false && je.estOccupeeAllie(positiontest2, joueur :1)==true
		&& je.estOccupeeAllie(positiontest3, joueur :1)==false){
			ok = true
	}

	return ok
}
