class Piece : PieceProtocol{
    private let numero : Int
    private var nom : String
    private var position : Position
    private var joueur : Int
    private var reserveBool : Bool = false
    
    required init(numero:  Int, nom: String, position: Position, joueur: Int){
        self.numero = numero
        self.nom = nom
        self.position = position
        self.joueur = joueur
    }
    
    func getPosition() -> Position{
        return self.position
    }
    
    func getJoueur() -> Int{
        return self.joueur
    }
    
    func estEnReserve() -> Bool{
        return self.reserveBool
    }
    
    func getNom() -> String{
        return self.nom
    }
    
    func getNumero() -> Int{
        return self.numero
    }
    
    func deplacementPossible(position : Position) -> Bool{
        return !position.getB()
    }
    
    @discardableResult
    func changerNom(nom : String)->Self{
        self.nom = nom
	return self
    }
    
    @discardableResult
    func changerJoueur(joueur : Int)->Self{
        self.joueur = joueur
	return self
    }
    
    @discardableResult
    func parachuter(position : Position)->Self{
        if self.estEnReserve(){
            self.position = position
            self.reserveBool = false
        }
        else{
            print("Erreur : cette piece n'est pas en reserve.\n")
        }
	return self
    }
    
    @discardableResult
    func deplacer(position : Position)->Self{
        self.position = position
	return self
    }
    
    @discardableResult
    func seFaireCapturer()->Self{
        var reserve : Position = Position(x : -1, y: -1, b: true)
        self.position = reserve
        if self.joueur == 1{
            self.joueur = 2
        }
        else{
            self.joueur = 1
        }
	return self
    }
    
    @discardableResult
    func evoluer() -> Self{
        self.nom = "kodama samourai"
        return self
    }
    
    @discardableResult
    func diminuer() -> Self{
        self.nom = "kodama"
        return self
    }
}
