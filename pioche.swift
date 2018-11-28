//Pioche contient les cartes d’un joueur qui ne sont pas encore dans le jeu (ni dans la main, le royaume, le champs de bataille, cimetière)
Protocol Pioche : Sequence {
	Associatedtype IteratorPioche : IteratorProtocol
	Where IteratorPioche.Element == Carte

	//init : ->Pioche
	//créer une pioche avec 20 cartes : 9 soldats, 6 gardes et 5 archers dans un ordre aléatoire
	Init()

	//TaillePioche : Pioche-> Int
	//retourne le nombre de cartes de la pioche
	//resultat : un entier
	//postcondition : entier retourné entre 0 et 20
	Func taillePioche()->Int

	//Piocher : Pioche -> Pioche
	//Enlève la premiere carte de la pioche (la carte la plus ancienne )
	//precondition : pioche non vide
	@discardableResult
	mutating Func piocher()->self

	//PiocheVide : Pioche -> Booleen
	//Indique si la pioche est vide ou non
	//resultat : Retourne vrai si la pioche est vide et faux sinon
	Func piocheVide()->Booleen
}
