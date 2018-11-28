protocol ChampsBataille  : Sequence { //iterateur
	Associatedtype IteratorCB : IteratorProtocol
	CreerChamps : -> [Case](6)
	ChampVide : ChampsBataille -> Booleen
}
