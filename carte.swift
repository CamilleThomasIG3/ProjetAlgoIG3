protocol Carte : {
	CreerCarte : -> Carte
	nom : Carte -> String
	attaque : Carte -> Int
	défense : Carte -> Int
	Position : Carte -> Position
	//par défaut pioche, royaume, cimetiere, entre 0 et 5
	EtatCarte : Carte -> Bool
	//attaque ou défense
	ModifierEtatCarte : Carte -> Carte
	EmplacementCarte : Carte -> Emplacement
}
