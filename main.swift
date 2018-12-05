//Main est une collection de cartes d'un joueur qui ne sont ni dans
//la pioche, le royaume, le champs de bataille, cimetière
protocol Main : Sequence{

	associatedtype IteratorMain : IteratorProtocol
	where IteratorMain.Element == Carte

	//init : -> Main
	//créer une main avec une seule carte : le roi du joueur (les joueurs ont des rois différents)
	//précondition: la carte doit être un Roi (nom "Roi")
	init(roi : Carte)

	//AjouterMain : Main x Carte -> Main
	//ajoute la carte passée en paramétre à la main
	//postcondition : ajouterMain(carte) => nbreCartesMain()=nbreCartesMain()+1
	@discardableResult
	mutating func ajouterMain(carte : Carte)->Self

	//AppartientMain : Main x Carte -> Bool
	//Indique si la carte appartient à la main
	//resultat : retourne vrai si la carte appartient à la main et faux si
	//elle n'appartient pas à la main ou si la main est vide
	//postcondition : ajouterMain(carte) => appartientMain(carte)==True => nbreCartesMain()>0
	func appartientMain(carte : Carte)->Bool

	//EnleverMain : Main x Carte -> Main
	//supprime la carte passée en paramétre de la main
	//precondition : appartientMain(carte)==True
	//postcondition : enleverMain(carte) => nbreCartesMain()=nbreCartesMain()-1
	//postcondition : enleverMain(carte) => appartientMain(carte) == false
	@discardableResult
	mutating func enleverMain(carte : Carte)->Self

	//getCarte : StringxIntxIntxMain -> Carte
	//retourne la carte avec le nom, la defense et attaque passés en parametre
	//données : le nom de la carte, les points de defense, les points d'attaque
	func getCarte(nom : String, defense : Int, attaque : Int) -> Carte

	//MainVide : Main -> Booleen
	//Indique si la main est vide ou non
	//resultat : Retourne vrai si la main est vide et faux sinon
	//postcondition : nbreCartesMain()=0 => mainVide()==True
	//postcondition : nbreCartesMain()>0 => mainVide()==False 
	func mainVide()->Bool

	//NbreCartesMain : Main -> Int
	//Retourne le nombre de cartes qu'a le joueur dans sa main
	//resultat : un entier
	//postcondition : resultat entre 0 et 7 (car a partir de 7 cartes, le joueur
	//doit obligatoirement en placer une dans le royaume)
	func nbreCartesMain()->Int

	//makeIterator : Main -> IteratorMain
	//créer un itérateur sur la collection pour pouvoir la parcourir de la carte la
	//plus ancienne à la carte la plus récente dans la main
	func makeIterator()->IteratorRoyaume
}
