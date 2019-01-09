public class Position : PositionProtocol {

  private var x : Int
  private var y : Int
  private var occupation : Bool

  //init : -> Position
  //Initialisation : Creation d une position a partir d un couple d entiers x et y qui representent les coordonees et d un booleen
  // l entier x doit etre compris entre 1 et 3 inclus
  // l entier y doit etre compris entre 1 et 4 inclus
  // le booleen b doit etre true si une piece occupe cette position, faux sinon
  // A l initialisation, les positions de coordonees (1,1);(1,2);(1,3);(2,2);(3,2);(4,1);(4,2);(4,3) sont occupees (b=true)
  public required init(x : Int, y : Int, b : Bool){
    self.x = x
    self.y = y
    self.occupation = b
  }

  //getX : Position -> Int
  //Description :
  //Renvoie la coordonnee x de cette position (accesseur) (comprise entre 1 et 3)
  public func getX() -> Int{
    return self.x
  }

  //getY : Position -> Int
  //Description :
  //Renvoie la coordonnee y de cette position (accesseur) (comprise entre 1 et 4)
  public func getY() -> Int{
    return self.y
  }

  //setX : Position x Int -> Position
  //Description :
  //Modifie la coordonnee x de cette position (comprise entre 1 et 3)
  func setX(x : Int){
    self.x = x
  }

  //setY : Position -> Int
  //Description :
  //Modifie la coordonnee y de cette position (comprise entre 1 et 4)
  func setY(y : Int){
    self.y = y
  }

  //getB : Position -> Bool
  //Description :
  //Renvoie le booleen b de cette position. (accesseur)
  //Renvoie true si la position est occupee par une piece, false sinon
  public func getB() -> Bool{
    return self.occupation
  }

  //estPromotion : Position x Int -> Bool
  //Description :
  //Renvoie vrai si la position donnee est en zone de promotion, faux sinon
  //Les cases en zone de promotion sont
  //(1,1);(2,1);(3,1) pour le joueur 1
  //(1,4);(2,4);(3,4) pour le joueur 2
  //Donnees et precondition :
  //Int : Le numero du joueur qui joue, compris entre 1 et 2
  //Resultat :
  //Renvoie un booleen
  public func estPromotion (joueur : Int)-> Bool{
    if joueur == 1{
      if (self.x == 1 && self.y == 1) || (self.x == 2 && self.y == 1) || (self.x == 3 && self.y == 1){
        return true
      }
      else{
        return false
      }
    }
    else{
      if (self.x == 1 && self.y == 4) || (self.x == 2 && self.y == 4) || (self.x == 3 && self.y == 4){
        return true
      }
      else{
        return false
      }
    }
  }

  //changerB : Position -> Position
  //Description :
  //change l occupation de la position.
  //Met le booleen b a false (si la position n est pas occupee par une piece) ou a true (si elle ne l est)
  @discardableResult
  func changerB()->Self{
    self.occupation = !self.occupation
    return self
  }
}
