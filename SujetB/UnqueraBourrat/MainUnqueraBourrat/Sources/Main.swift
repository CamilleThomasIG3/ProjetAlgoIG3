import ProtoUnqueraBourrat
import Foundation
import String


//main

//initialisation de la partie
var plateau : PlateauProtocol
var jeu : JeuProtocol

//initialisation des compteurs pour les promotions
var CpromoKoro1 : Int = 0
var CpromoKoro2 : Int = 0
var CpromoKoda1 : Int = 0
var CpromoKoda2 : Int = 0

//Au tour du joueur 1
var player : Int = 1 

//initialisation des choix de l'utilisateur
var ChoixPos : PositionProtocol
var ChoixPiece : PieceProtocol
var finPartie : Bool

plateau.init()
jeu.init()

while !finPartie {
	print("Veuillez selectionner une piece a jouer")

	//On montre au joueur toutes les pieces qu il possede (et peut jouer)
	IteratorJeu1 = jeu.makeIterator()
	while let piecein = IteratorJeu1.next() {
		print("vous possedez les pieces suivantes :")
		if (piecein.getJoueur()==player){
			print("numero : ", piecein.getNumero(), "nom : ", piecein.getNom(), "coordonnee x: ", piecein.getPosition().getX(), "coordonnee y : ", piecein.getPosition().getY())
		}
	}

	//On lui demande donc de choisir un numero qui correspondra a la piece qu il veut jouer
	var ok1 : Bool = false
	while (! ok1) {
	print ("Veuillez choisir le numero de la piece a jouer")
		if let ChoixNum = readLine() {
			if let n = Int(ChoixNum) {
				if (n>0 && n<9) {
						//On recherche la piece dont le numero est ChoixNum
						IteratorPiec = jeu.makeIterator()
						while let Piec = IteratorPiec.next() {
							if (Piec.getNumero()==ChoixNum){
								ChoixPiece = Piec	
							}
						}
						//Si la piece correspondant au numero appartient bien a ce joueur, c est valide
						if (ChoixPiece.getJoueur()==player){
							print("c est valide")
							ok1 = true
						}

						else {
							print("Cette piece ne vous appartient pas")
						}
				}

				else {
					print("Veuillez recommencer en choisissant un numero valide")
				}
			}
		}
	}

	if (ChoixPiece.estEnReserve()) {
		//On lui la position a laquelle il veut parachuter si la piece est en reserve
		print("Veuillez chosisir la position a parachuter")
		var ok2 : Bool = false
		while (!ok2) {
			print("choisir x compris entre 1 et 3")
			if let x = readLine(){
				if let int1 = Int(x) {
					if (int1>0 && int1<4){
						print ("maintenant choisir y entre 1 et 4")
						if let y = readLine() {
							if let int2 = Int(y){
								if (int2>0 && int2<5){
									ChoixPos=plateau.getPos(x,y)
									if (!ChoixPos.getB()){
										print("Coordonnees valides et case libre, parachutage active")
										ok2=true
									}
								}
							}
						}
					}
				}
			}
		}
		//Arret : La case choisie est libre et valide
		ChoixPiece.parachuter(position : ChoixPos) 
	}

	else {
		//On lui la position a laquelle il veut se deplacer
		print("Veuillez chosisir la position a se deplacer")
		var ok3 : Bool = false
		while (!ok3) {
			print("choisir x compris entre 1 et 3")
			if let x1 = readLine(){
				if let int1 = Int(x1) {
					if (int1>0 && int1<4){
						print ("maintenant choisir y entre 1 et 4")
						if let y1 = readLine() {
							if let int2 = Int(y1){
								if (int2>0 && int2<5){
									ChoixPos=plateau.getPos(x : x1, y: y1)
									if let monstre = jeu.getPiece(position :choixPos){
										if (!jeu.estOccupeeAllie(position : ChoixPos, joueur : player) && monstre.deplacementPossible(position : ChoixPos)){
										print("Les coordonnees de deplacement sont validees")
										ok3=true
										}
									}
								}
							}
						}
					}
				}
			}
		}
		// Arret : La position n'est pas occupee par un allie et le deplacement est possible

		//On regarde si la position a laquelle le joueur veut deplacer sa piece est occupee par un ennemi
		if (jeu.estOccupeeEnnemi(position : ChoixPos, joueur : player)) {
			if let monstre = jeu.getPiece(position : choixPos){
				//si on capture un koropokkuru adverse, la partie est gagnee
				if (monstre.getNom()=="koropokkuru"){
					print ("Le joueur ")
					print(player)
					print (" a gagne ")
					finPartie == true
				}
				else {
				//si on capture un kodama samurai adverse, il redevient kodama
					if (monstre.getNom()=="kodama samuraï"){
						monstre.diminuer()
					}
				}
				monstre.seFaireCapturer()
			}
			
			ChoixPiece.deplacer(position : ChoixPos)
		}
	}

// Parcourt de la collection de piece (de jeu) jusqu a rencontrer celle dont le numero est ...
	IteratorJeu = jeu.makeIterator()
	while let piecein = IteratorJeu.next() {
		//Remet les compteurs a 0 si la piece nest plus en zone de promotion
		//Sinon
		//Si un roi (numero 1 et 2) est en zone de promotion depuis 1 tour, la partie est gagnee
		//Si un kodama (numero 3 et 4) est en zone de promotion depuis 1 tour, il evolue
		//Si un roi est en zone de promotion mais pas depuis 1 tour, le compteur s incremente
		//Si un kodama est en zone de promotion mais pas depuis 1 tour depuis 1 tour, le compteur s incremente
		if (piecein.getNumero()==1){
			if (!piecein.getPosition().estPromotion()){ //SI PAS NULLLE 
				CpromoKoro1=0
			}

			else {
				if(CpromoKoro1==1) {
					print("Le joueur ",piecein.getJoueur()" a gagne la partie")
					finPartie = true
				}
				else {
					CpromoKoro1 = CpromoKoro1 + 1
				}
			}
		} 

		if (piecein.getNumero()==2){
			if (!piecein.getPosition().estPromotion()) { //SI PAS NULLLE 
				CpromoKoro2=0
			}

			else {
				if(CpromoKoro2==1) {
					print("Le joueur ",piecein.getJoueur()" a gagne la partie")
					finPartie = true
				}
				else {
					CpromoKoro2 = CpromoKoro2 +1
				}
			}
        }

        if (piecein.getNumero()==3 && piecein.getNom()=="kodama"){
			if (!piecein.getPosition().estPromotion()) { //SI PAS NULLLE 
				CpromoKoda1=0
			}

			else {
				if(CpromoKoda1==1) {
					print("Le kodama du joueur", piecein.getJoueur(), " evolue")
					piecein.evoluer()
				}
				else {
					CpromoKoda1 = CpromoKoda1+1
				}
			}
        }

        if (piecein.getNumero()==4 && piecein.getNom()=="kodama"){
			if (!piecein.getPosition().estPromotion()) { //SI PAS NULLLE 
				CpromoKoda2=0
			}

			else {
				if(CpromoKoda2==1) {
					print("Le kodama du joueur", piecein.getJoueur(), " evolue")
					piecein.evoluer()
				}
				else {
					CpromoKoda2 = CpromoKoda2 +1
				}
			}
        }
    }

	//Gestion des tours :
	//Si c'était le joueur 1 qui jouait, le tour passe au joueur 2
	//Sinon le tour passe au joueur 1
	if (player == 1 ) {
		player = 2
	}

	else {
		player = 1
	}

}
