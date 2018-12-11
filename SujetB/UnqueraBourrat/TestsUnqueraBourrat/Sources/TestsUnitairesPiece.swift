import Foundations

//Test des fonctions de position

func testgetX() -> Bool{
    var pos = Position(x : 1, y: 3, b: True)
    return pos.getX() == 1
}

func testGetY() -> Bool{
    var pos = Position(x : 1,y :3, b:True)
    return pos.getY() == 3
}

func TestgetB() -> Bool{
    var pos1 = Position(x: 2, y: 3, b:false)
    var pos2 = Position(x :2,y: 1,b: true)
    return !pos1.getB() && pos2.getB()
}

func TestchangerB() -> Bool{
    var pos1 = position(x:2,y:3,b:false)
    var pos2 = position(x:2,y:1,b:true)
    pos1.changerOccupation()
    pos2.changerOccupation()
    return (pos1.getB() && !pos2.getB())
}

func TestEstPromotion() -> Bool{
    positionTest1 = Position(x : 1, y : 1, b : true)
    positionTest2 = Position(x : 2, y : 1, b : true)
    positionTest3 = Position(x : 3, y : 1, b : true)
    positionTest4 = Position(x : 1, y : 4, b : true)
    positionTest5 = Position(x : 2, y : 4, b : true)
    positionTest6 = Position(x : 3, y : 4, b : true)
    positionTest7 = Position(x : 2, y : 2, b : true)

    return(positionTest1.estPromotion() && positionTest2.estPromotion() && positionTest3.estPromotion()
    && positionTest4.estPromotion() && positionTest5.estPromotion() && positionTest5.estPromotion() && !positionTest7.estPromotion() )
}

//Test des fonctions de pieces



func TestGetPosition() -> Bool{
    var pieceTest = Piece(numero : 1,nom : "Koropokkuru", position : (1,1,false),joueur : 1)
	return pieceTest.getPosition() == (1,1,false)
}


func TestGetJoueur(){
    var pieceTest = Piece(numero : 5,nom : "Koropokkuru",position : (1,1,false), joueur : 1)
	return pieceTest.getJoueur() == 1
}

func TestGetNom(){
    var pieceTest = Piece(numero : 1,joueur : "Koropokkuru", position : (1,1,false), joueur : 1)
	return pieceTest.getNom() == "Koropokurru"
}

func TestGetNumero(){
    var pieceTest = Piece(numero : 5,joueur : "Koropokkuru", position : (2,1,false), joueur : 1)
	return pieceTest.getNumero() == 5
}

func TestChangerNom() -> Bool{
    var pieceTest = Piece(numero : 5,joueur : "kodama", position : (2,1,false), joueur : 1)
	pieceTest.changerNom("koropokkuru")
	return (pieceTest.getNom() == "koropokkuru")
}

func TestChangerJoueur(pieceTest:Piece)-> Bool{
    var pieceTest1 = Piece(numero : 5,joueur : "kodama", position : (2,1,false), joueur : 1)
    var pieceTest2 = Piece(numero : 5,joueur : "kodama", position : (2,1,false), joueur : 2)
    pieceTest1.changerJoueur()
    pieceTest2.changerJoueur()

    return (pieceTest1.getJoueur()==2,pieceTest2.getJoueur()==1)

}


func TestEstEnReserve(pieceTest : Piece)-> Bool{
    var pieceTest1 = Piece(numero : 5,joueur : "kodama", position : (-1,-1,false), joueur : 1)
    var pieceTest2 = Piece(numero : 5,joueur : "kodama", position : (2,-1,false), joueur : 2)
    
    return (pieceTest1.EstEnReserve() && !pieceTest2.EstEnReserve())
    
}

func TestParachuter(){
	pieceTest1 = Piece(1,"kodama",(-1,-1,true),1)
	pieceTest2 = Piece(1,"kitsune",(1,2,true),1)
	positionTest1 = Position(x : 1, y : 2, b : true)
	positionTest2 = Position(x : 1, y : 2, b : false)
	positionTest3 = Position(x : -1, y : -1, b : true)
	positionTest4 = Position(x : 1, y : 5, b : false)
	var ok = false
	do{
		try pieceTest1.parachuter(positionTest1) //parachuter sur position occupe
		ok = false
		print("error test1")
	}
	catch {
		ok=true
	}
	do{
		try pieceTest1.parachuter(positionTest4) //parachuter sur position hors plateau
		ok = false
		print("error test2")
	}
	catch {
		ok=true
	}
    do{
		try pieceTest2.parachuter(positionTest2) //parachuter piece qui n'est pas dans la reserve
		ok = false
		print("error test3")
	}
	catch {
		ok=true
	}
    do
    {
		try pieceTest1.parachuter(positionTest3) //parachuter la piece dans la reserve
		ok = false
		print("error test4")
	}
	catch {
		ok=true
	}
    do{
		try pieceTest1.parachuter(positionTest2) //parachuter piece de la reserve sur position libre
		ok = true
	}
	catch {
		ok=false
        print("error test5")
	}
	return ok
}

func TestSeFaireCapturer() -> Bool{
    var pieceTest1 = Piece(numero : 1, nom : "tanuki", position : (2,2,true), joueur : 1)
    var pieceTest2 = Piece(numero : 1, nom : "tanuki", position : (2,2,true), joueur : 2)
    pieceTest1.sefaireCapturer()
    pieceTest2.sefaireCapturer()

    return (pieceTest1.getJoueur() == 2 && pieceTest2.getJoueur() == 1 && pieceTest1.estEnReserve()==true)

} 

func TestDeplacer() -> Bool{
    var pieceTest1 = Piece(numero : 1, nom : "tanuki", position : (2,2,true), joueur : 1)
    var positionTest1 = Position(x:-1 ,y:-1 , b:true )
    var positionTest2 = Position(x:0 ,y:5 , b:false)
    var positionTest3 = Position(x:2 ,y:3 , b:false)
    
    var ok1 : Bool
    var ok2 : Bool
    var ok3 : Bool
    
    pieceTest1.deplacer(positionTest3)
    if (pieceTest1.getPosition().getX()==2 && pieceTest1.getPosition().getY()==2 && pieceTest1.getPosition().getB()==true) {
        ok1 = true
    }
        
    pieceTest1.deplacer(positionTest2)
    if (pieceTest1.getPosition().getX()==2 && pieceTest1.getPosition().getY()==3 && pieceTest1.getPosition().getB()==true){
        ok2 = true
    }
        
    pieceTest1.deplacer(positionTest1)
    if (pieceTest1.getPosition().getX()==2 && pieceTest1.getPosition().getY()==2 && pieceTest1.getPosition().getB()==true){
        ok3 = true
    }
        
    return (ok1 && ok2 && ok3)

}




func TestDeplacementPossible() -> Bool{
        var pieceTest1 = Piece(numero : 1,"tanuki",(2,2,true),1)
        var pieceTest2 = Piece(numero : 2,"kodama",(2,2,true),1)
        var pieceTest3 = Piece(numero : 3,"koropokkuru",(2,2,true),1)
        var pieceTest4 = Piece(numero : 4,"kitsune",(2,2,true),1)
        var pieceTest5 = Piece(numero : 5,"kodama samurai",(2,2,true),1)
        var pieceTest6 = Piece(numero : 7,"kodama",(2,2,true),2)
        var pieceTest7 = Piece(numero : 10,"kodama samurai",(2,2,true),2)

        
        var positionTest1 = Position(x:1 ,y:1 , b:true)
        var positionTest2 = Position(x:1 ,y:2 , b:false)
        var positionTest3 = Position(x:1 ,y:3 , b:false)
        var positionTest4 = Position(x:2 ,y:1 , b:true)
        var positionTest5 = Position(x:2 ,y:3 , b:false)
        var positionTest6 = Position(x:3 ,y:1 , b:false)
        var positionTest7 = Position(x:3 ,y:2 , b:false)
        var positionTest8 = Position(x:3 ,y:3 , b:false)
        
        var ok1 : Bool
        var ok2 : Bool
        var ok3 : Bool
        var ok4 : Bool
        var ok5 : Bool
        var ok6 : Bool
        var ok7 : Bool
        var ok8 : Bool

        
        //tanuki j1
        if (pieceTest1.deplacementPossible(positionTest1) == false &&
        pieceTest1.deplacementPossible(positionTest2) == true &&
        pieceTest1.deplacementPossible(positionTest3) == false  &&
        pieceTest1.deplacementPossible(positionTest4) == true  &&
        pieceTest1.deplacementPossible(positionTest5) == true  &&
        pieceTest1.deplacementPossible(positionTest6) == false &&
        pieceTest1.deplacementPossible(positionTest7) == true &&
        pieceTest1.deplacementPossible(positionTest8) == false ) {
        ok1 = true
        }
        //kodam j1
        if (pieceTest2.deplacementPossible(positionTest1) == false &&
        pieceTest2.deplacementPossible(positionTest2) == true &&
        pieceTest2.deplacementPossible(positionTest3) == false  &&
        pieceTest2.deplacementPossible(positionTest4) == false  &&
        pieceTest2.deplacementPossible(positionTest5) == false  &&
        pieceTest2.deplacementPossible(positionTest6) == false &&
        pieceTest2.deplacementPossible(positionTest7) == false &&
        pieceTest2.deplacementPossible(positionTest8) == false) {
        ok2 = true
        }
        
        //koro
        if (pieceTest3.deplacementPossible(positionTest1) == true &&
        pieceTest3.deplacementPossible(positionTest2) == true &&
        pieceTest3.deplacementPossible(positionTest3) == true  &&
        pieceTest3.deplacementPossible(positionTest4) == true  &&
        pieceTest3.deplacementPossible(positionTest5) == true  &&
        pieceTest3.deplacementPossible(positionTest6) == true &&
        pieceTest3.deplacementPossible(positionTest7) == true &&
        pieceTest3.deplacementPossible(positionTest8) == true ) {
        ok3 = true
        }
        //kitsune
        if (pieceTest4.deplacementPossible(positionTest1) == true &&
        pieceTest4.deplacementPossible(positionTest2) == false &&
        pieceTest4.deplacementPossible(positionTest3) == true  &&
        pieceTest4.deplacementPossible(positionTest4) == false  &&
        pieceTest4.deplacementPossible(positionTest5) == false  &&
        pieceTest4.deplacementPossible(positionTest6) == true &&
        pieceTest4.deplacementPossible(positionTest7) == false &&
        pieceTest4.deplacementPossible(positionTest8) == true ) {
        ok4 = true
        }
        
        //kodama samurai j1
        if (pieceTest5.deplacementPossible(positionTest1) == true &&
        pieceTest5.deplacementPossible(positionTest2) == true &&
        pieceTest5.deplacementPossible(positionTest3) == true  &&
        pieceTest5.deplacementPossible(positionTest4) == true  &&
        pieceTest5.deplacementPossible(positionTest5) == true  &&
        pieceTest5.deplacementPossible(positionTest6) == false &&
        pieceTest5.deplacementPossible(positionTest7) == true &&
        pieceTest5.deplacementPossible(positionTest8) == false ) {
        ok5 = true
        }
        
        //kodama j2
        if (pieceTest2.deplacementPossible(positionTest1) == false &&
        pieceTest2.deplacementPossible(positionTest2) == false &&
        pieceTest2.deplacementPossible(positionTest3) == false  &&
        pieceTest2.deplacementPossible(positionTest4) == false  &&
        pieceTest2.deplacementPossible(positionTest5) == false  &&
        pieceTest2.deplacementPossible(positionTest6) == false &&
        pieceTest2.deplacementPossible(positionTest7) == true &&
        pieceTest2.deplacementPossible(positionTest8) == false ) {
        ok6 = true
        }
        
        //kodama samurai j2
        if (pieceTest3.deplacementPossible(positionTest1) == false &&
        pieceTest3.deplacementPossible(positionTest2) == true &&
        pieceTest3.deplacementPossible(positionTest3) == false  &&
        pieceTest3.deplacementPossible(positionTest4) == true  &&
        pieceTest3.deplacementPossible(positionTest5) == true  &&
        pieceTest3.deplacementPossible(positionTest6) == true &&
        pieceTest3.deplacementPossible(positionTest7) == true &&
        pieceTest3.deplacementPossible(positionTest8) == true ) {
        ok7 = true
        }
        
        return (ok1 && ok2 && ok3 && ok4 && ok5 && ok6 && ok7)
        
}
        
        
        
        




func TestEvoluer(){
	var pieceTest1 = Piece(1,"kodama",(1,1,true),1)
	var pieceTest2 = Piece(1,"koropokkuru",(1,2,true),1)
	piecetest1.Evoluer()
	pieceTest2.Evoluer()
	return (pieceTest1.getNom == "kodama samurai" && pieceTest2.getNom == "koropokkuru")
}    


func TestDiminuer(){
	var pieceTest1 = Piece(1,"kodama",(2,2,true),1)
	var pieceTest2 = Piece(1,"kodama samurai",(1,2,true),1)
	piecetest1.Evoluer()
	pieceTest2.Evoluer()
	return (pieceTest1.getNom == "kodama" && pieceTest2.getNom == "kodama samurai")

}


//test des fonctions de partie
