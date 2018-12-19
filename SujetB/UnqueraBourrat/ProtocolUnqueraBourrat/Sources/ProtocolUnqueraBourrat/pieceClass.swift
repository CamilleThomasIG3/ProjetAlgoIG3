class Piece : PieceProtocol{
    typealias Position = Position
    private let numero : Int
    private var nom : String
    private var position : Position
    private var joueur : Int
    private var reserveBool : Bool = false
    
    init(numero:  Int, nom: String, position: Position, joueur: Int){
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
    func changerNom(nom : String){
        self.nom = nom
    }
    
    @discardableResult
    func changerJoueur(joueur : Int){
        self.joueur = joueur
    }
    
    @discardableResult
    func parachuter(position : Position){
        if self.estEnReserve(){
            self.position = position
            self.reserveBool = false
        }
        else{
            print("Erreur : cette piece n'est pas en reserve.\n")
        }
    }
    
    @discardableResult
    func deplacer(position : Position){
        self.position = position
    }
    
    @discardableResult
    func seFaireCapturer(){
        var reserve : Position = Position(x : -1, y: -1, b: true)
        self.position = reserve
        if self.joueur == 1{
            self.joueur = 2
        }
        else{
            self.joueur = 1
        }
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
