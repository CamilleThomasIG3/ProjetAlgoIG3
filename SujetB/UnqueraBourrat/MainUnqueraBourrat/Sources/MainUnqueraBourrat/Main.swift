import Foundation
import ProtocolUnqueraBourrat

//initialisation de la partie
var plateau : Plateau
var jeu : Jeu

//initialisation des compteurs pour les promotions
var CpromoKoro1 : Int = 0
var CpromoKoro2 : Int = 0

//Au tour du joueur 1
var player : Int = 1

//initialisation des choix de l'utilisateur
var ChoixPos : Position
var ChoixPiece : Piece
var finPartie : Bool = false

//initialisation des variables jeu, partie
plateau = Plateau()
jeu = Jeu()


//Description : On lui demande donc de choisir un numero qui correspondra a la piece qu il veut jouer
//Resultat : Renvoie le choix de la piece de l utilisateur
func choisirPiece () -> Piece{
	var ok1 : Bool = false
	var Pos : Position = Position(x: 0, y: 0, b: false)
	var ChoixPiece : Piece = Piece(numero:  1, nom: "koropokkuru", position: Pos, joueur: 1)
	while (!ok1) {
	print ("Veuillez choisir le numero de la piece a jouer")
		if let ChoixNum = readLine() {
			if let n = Int(ChoixNum) {
				if (n>0 && n<9) {
						//On recherche la piece dont le numero est ChoixNum
						var IteratorPiec = jeu.makeIterator()
						while let Piec = IteratorPiec.next() {
							if (Piec.getNumero()==n){
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
	return ChoixPiece
}


//On lui demande la position a laquelle il veut se deplacer
func choisirPos() -> Position {
	var ok3 : Bool = false
	var ChoixPos : Position = Position(x: 0, y: 0, b: false)
	while (!ok3) {
		print("choisir x compris entre 1 et 3")
		if let x1 = readLine(){
			if let int1 = Int(x1) {
				if (int1>0 && int1<4){
					print ("maintenant choisir y entre 1 et 4")
					if let y1 = readLine() {
						if let int2 = Int(y1){
							if (int2>0 && int2<5){
								ChoixPos = plateau.getPos(x : int1, y: int2)
								if (!jeu.estOccupeeAllie(position : ChoixPos, joueur : player)) {
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
	// Arret : La position n'est pas occupee par un allie et le deplacement est possible
	return ChoixPos
}


while !finPartie {
	print("Veuillez selectionner une piece a jouer")
	print("vous possedez les pieces suivantes :")
	//On montre au joueur toutes les pieces qu il possede (et peut jouer)
	var IteratorJeu1 = jeu.makeIterator()
	while let piecein = IteratorJeu1.next() {
		if (piecein.getJoueur()==player){
			print("numero :  \(piecein.getNumero()) , nom : \(piecein.getNom()) , coordonnee x: \(piecein.getPosition().getX()) coordonnee y : \(piecein.getPosition().getY()) ")
		}
	}

	var okChoix : Bool = false
	while (!okChoix) {
		ChoixPiece = choisirPiece()
		if (ChoixPiece.estEnReserve()) {
			//On lui la position a laquelle il veut parachuter si la piece est en reserve
			print("Veuillez chosisir la position a parachuter")
			ChoixPos = choisirPos()
			while (jeu.estOccupeeEnnemi(position : ChoixPos, joueur : player)) {
				print ("Position occupee par un ennemi, parachutage impossible, veuillez choisir une autre position")
				ChoixPos = choisirPos()
			}
			print("position pour parachutage ok")
			//Arret : La case choisie est libre et valide
			ChoixPiece.parachuter(position : ChoixPos)
			okChoix = true
		}
		else {
			print ("Veuillez choisir une position pour le deplacement")
			ChoixPos = choisirPos()
			if (ChoixPiece.deplacementPossible(position : ChoixPos)){
				okChoix = true
				print ("position ok pour deplacement")
					//On regarde si la position a laquelle le joueur veut deplacer sa piece est occupee par un ennemi
					if (jeu.estOccupeeEnnemi(position : ChoixPos, joueur : player)) {
						if let monstre = jeu.getPiece(position : ChoixPos){
							//si on capture un koropokkuru adverse, la partie est gagnee
							if (monstre.getNom()=="koropokkuru"){
								print ("Le joueur ")
								print(player)
								print (" a gagne ")
								finPartie = true
							}
							else {
							//si on capture un kodama samurai adverse, il redevient kodama
								if (monstre.getNom()=="kodama samuraï"){
									monstre.diminuer()
									print("kodama samourai redevient samourai\n")
								}
							}
							monstre.seFaireCapturer()
							print("capturé\n")
						}
					}
					ChoixPiece.deplacer(position : ChoixPos)
					print("piece déplacée\n")
			}
			else{
				print("Votre pièce ne vous permet pas de vous déplacer à cette position\n")
			}

		}
	}



// Parcourt de la collection de piece (de jeu) jusqu a rencontrer celle dont le numero est ...
	var IteratorJeu = jeu.makeIterator()
	while let piecein = IteratorJeu.next() {
		//Remet les compteurs a 0 si la piece nest plus en zone de promotion
		//Sinon
		//Si un roi (numero 1 et 2) est en zone de promotion depuis 1 tour, la partie est gagnee
		//Si un kodama (numero 3 et 4) est en zone de promotion depuis 1 tour, il evolue

		//Correction (ci-dessus): Faux, d'après les règles, le kodama évolue dès qu'il arrive en zone de promotion

		//Si un roi est en zone de promotion mais pas depuis 1 tour, le compteur s incremente
		//Si un kodama est en zone de promotion mais pas depuis 1 tour depuis 1 tour, le compteur s incremente

		//Correction (ci-dessus): Pas de compteur pour kodama car l'évolution est instantannée
		if (piecein.getNumero()==1){
			if (!piecein.getPosition().estPromotion(joueur: 1)){ //SI PAS NULLLE
				CpromoKoro1=0
			}

			else {
				if(CpromoKoro1==1) {
					print("Le joueur \(piecein.getJoueur()) a gagne la partie")
					finPartie = true
				}
				else {
					CpromoKoro1 = CpromoKoro1 + 1
					print("Si votre Koropokkuru reste un tour dans la zone de promotion vosu gagnerez\n")
				}
			}
		}

		if (piecein.getNumero()==2){
			if (!piecein.getPosition().estPromotion(joueur: 2)) { //SI PAS NULLLE
				CpromoKoro2=0
			}

			else {
				if(CpromoKoro2==1) {
					print("Le joueur \(piecein.getJoueur()) a gagne la partie" )
					finPartie = true
				}
				else {
					CpromoKoro2 = CpromoKoro2 + 1
					print("Si votre Koropokkuru reste un tour dans la zone de promotion vosu gagnerez\n")
				}
			}
    }

    if (piecein.getNumero()==3 && piecein.getNom()=="kodama"){
			if (piecein.getPosition().estPromotion(joueur: 1)) { //!piecein.getPosition().estPromotion(joueur: 1) il faut enlever le"!" !!
				print("Le kodama du joueur \(piecein.getJoueur()) evolue")
				piecein.evoluer()
			}
    }

    if (piecein.getNumero()==4 && piecein.getNom()=="kodama"){
			if (piecein.getPosition().estPromotion(joueur: 2)) { //SI PAS NULLE //Pareil qu'au-dessus
				print("Le kodama du joueur \(piecein.getJoueur()) , evolue")
				piecein.evoluer()
			}
    }
	}

	//Gestion des tours :
	//Si c'était le joueur 1 qui jouait, le tour passe au joueur 2
	//Sinon le tour passe au joueur 1
	if (player == 1 ) {
		player = 2
		print("C'est au joueur 2")
	}

	else {
		player = 1
		print("C'est au joueur 1")
	}

}
