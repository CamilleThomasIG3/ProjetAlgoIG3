public class Plateau : PlateauProtocol{
    fileprivate var plateau = [[Position]]()

    public required init(){
        for i in 0..<4 {
            var row = [Position]()
            for j in 0..<3 {
              row.append(Position(x: j+1, y: i+1, b : false))
            }
            self.plateau.append(row)
        }
        self.plateau[3][1].changerB()
        self.plateau[0][1].changerB()
        self.plateau[2][1].changerB()
        self.plateau[1][1].changerB()
        self.plateau[3][0].changerB()
        self.plateau[0][2].changerB()
        self.plateau[3][2].changerB()
        self.plateau[0][0].changerB()
    }

    public func getPos(x: Int, y: Int) -> Position {
        return self.plateau[y-1][x-1]
    }

    public func makeIterator() -> IteratorPlateau {
        return IteratorPlateau(plateau: self)
    }
}

public struct IteratorPlateau : IteratorProtocol{
    let plateau : Plateau
    var indiceLigne : Int
    var indiceCol : Int
    var posCourante : Position

    init(plateau: Plateau){
        self.plateau = plateau
        self.indiceLigne = 0
        self.indiceCol = 0
        self.posCourante = plateau.plateau[0][0]
    }

    public mutating func next() -> Position? {
        var tmp : Position = self.plateau.plateau[0][0]
        if self.indiceLigne < 4 {
            if self.indiceCol+1 < 3 {
                tmp = self.posCourante
                indiceCol+=1
            }
            else if indiceLigne+1 < 4{
                tmp = self.posCourante
                indiceLigne+=1
                indiceCol=0
            }
            self.posCourante = self.plateau.plateau[indiceCol][indiceLigne]
            return tmp
        }
        else{
            return nil
        }
    }
}
