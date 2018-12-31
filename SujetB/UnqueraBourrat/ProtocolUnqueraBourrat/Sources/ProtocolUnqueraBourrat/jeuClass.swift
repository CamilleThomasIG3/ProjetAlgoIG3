class Jeu : JeuProtocol{

  fileprivate var pieces : [Piece] = []

  //init : -> Jeu
  //Initialisation : Creation d une collection de pieces comportant tous les yokais/pieces du jeu
  //initialise les pieces des joueurs sur les bonnes positions
  //on aura donc :
  //le koropokkuru du joueur 1 en position (2,4, vrai)
  //le koropokkuru du joueur 2 en Position (2,1, vrai)
  //le kodama du joueur 1 en position (2,3, vrai)
  //le kodama du joueur 2 en position (2,2, vrai)
  //le kitsune du joueur 1 en position (1,4, vrai)
  //le kitsune du joueur 2 en position (3,1, vrai)
  //le tanuki du joueur 1 en position (3,4, vrai)
  //le tanuki du joueur 2 en position (1,1, vrai)
  required init()
  {
    let position0 = Position(x : 2, y : 4, b : true)
    let position1 = Position(x : 2, y : 1, b : true)
    let position2 = Position(x : 2, y : 3, b : true)
    let position3 = Position(x : 2, y : 2, b : true)
    let position4 = Position(x : 1, y : 4, b : true)
    let position5 = Position(x : 3, y : 1, b : true)
    let position6 = Position(x : 3, y : 4, b : true)
    let position7 = Position(x : 1, y : 1, b : true)

    self.pieces[0] = Piece(numero : 1, nom : "koropokkuru", position : position0, joueur : 1)
    self.pieces[1] = Piece(numero : 2, nom : "koropokkuru", position : position1, joueur : 2)
    self.pieces[2] = Piece(numero : 3, nom : "kodama", position : position2, joueur : 1)
    self.pieces[3] = Piece(numero : 4, nom : "kodama", position : position3, joueur : 2)
    self.pieces[4] = Piece(numero : 5, nom : "kitsune", position : position4, joueur : 1)
    self.pieces[5] = Piece(numero : 6, nom : "kitsune", position : position5, joueur : 2)
    self.pieces[6] = Piece(numero : 5, nom : "tanuki", position : position6, joueur : 1)
    self.pieces[7] = Piece(numero : 6, nom : "tanuki", position : position7, joueur : 2)
  }

  //makeIterator : Jeu -> IteratorJeu
  //Description :
  //Parcourt toutes les pieces
  //Creer un iterateur sur la collection pour iterer avec for in
  func makeIterator() -> IteratorJeu{
    return IteratorJeu(j : self)
  }

  //getPiece : Jeu x Position -> (Piece | Vide)
  //Description :
  //Renvoie la piece correspondant a la position passee en parametre
  //ou vide s il n y en a pas
  //Donnees :
  //Position : La position a laquelle se situe la piece qu on veut.
  //La 1ere coordonnee de la position doit etre un entier compris entre 1 et 3 inclus
  //La 2eme coordonnee de la position doit etre un entier compris entre 1 et 4 inclus
  //Resultat et postcondition :
  //renvoie la piece a laquelle la position correspond
  func getPiece (position : Position) -> Piece?{
    var p2 : Piece?
    if position.getB(){
      for p in self{
        if p.getPosition().getX()==position.getX() && p.getPosition().getY()==position.getY(){
          p2 = p
        }
      }
    }
    else{
	p2 = nil
    }
    return p2
  }

  //estOccupeeAllie : Jeu x Position x Int -> Bool
  //Description :
  //	Renvoie vrai si une piece alliee est sur la position donnee en parametre, faux sinon
  //Donnees et precondition :
  //	Position : la position qu on veut etudier
  //	La 1ere coordonnee de la position doit etre un entier compris entre 1 et 3 inclus
  //	La 2eme coordonnee de la position doit etre un entier compris entre 1 et 4 inclus
  //	Int : Le numero du joueur qui joue, compris entre 1 et 2
  //Resultat :
  //	Renvoie un booleen vrai si une piece alliee est sur la position donnee en parametre, faux sinon
  func estOccupeeAllie (position : Position, joueur : Int) -> Bool{
    var b : Bool = false
    if position.getB(){//position occupée
      for p in self{
        if p.getPosition().getX()==position.getX() && p.getPosition().getY()==position.getY(){//la piece a la bonne position
          if p.getJoueur()==joueur//si la piece appartient au joueur courant
          {
            b = true
          }
          else{
	 	b = false //si elle appartient au joueur adverse
	  }
        }
      }
    }
    else{
	b = false//position non occupée
    }
    return b
  }

  //estOccupeeEnnemi : Jeu x Position x Int -> Bool
  //Description :
  //	Renvoie vrai si une piece ennemie est sur la position donnee en parametre, erreur si position egal a (-1,-1), faux sinon
  //Donnees et precondition :
  //	Position : la position qu on veut etudier
  //	La 1ere coordonnee de la position doit etre un entier compris entre 1 et 3 inclus
  //	La 2eme coordonnee de la position doit etre un entier compris entre 1 et 4 inclus
  //	Int : Le numero du joueur qui joue, compris entre 1 et 2
  //Resultat :
  //	Renvoie un booleen vrai si une piece ennemie est sur la position donnee en parametre, faux sinon
  func estOccupeeEnnemi (position : Position, joueur : Int) -> Bool{
    var b : Bool = false
    if position.getB(){//position occupée
      for p in self{
        if p.getPosition().getX()==position.getX() && p.getPosition().getY()==position.getY(){//la piece a la bonne position
          if p.getJoueur()==joueur//si la piece appartient au joueur courant
          {
            b = false
          }
          else{
	 	b = true //si elle appartient au joueur adverse
	  }
        }
      }
    }
    else{
	b = false//position non occupée
    }
    return b
  }
}

struct IteratorJeu : IteratorProtocol{

  fileprivate var courant : Int = 0
  fileprivate let jeu : Jeu

  fileprivate init(j : Jeu)
  {
    self.courant = -1
    self.jeu = j
  }

  mutating func next()->Piece?
  {
    self.courant+=1
    guard self.courant < self.jeu.pieces.count
    else{
      return nil
    }
    return self.jeu.pieces[self.courant]
  }
}
