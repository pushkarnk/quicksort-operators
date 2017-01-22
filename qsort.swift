prefix operator ⍴
prefix func ⍴(w: [Int]) -> Int { return w.count }

prefix operator ⚀
prefix func ⚀(w: [Int]) -> Int { return w[0] }

prefix operator ⤚
prefix func ⤚(w: [Int]) -> [Int] { return Array(w[1..<w.count]) }

infix operator ¦
func ¦ (w: [Int], predicate: (Int)->Bool) -> [Int] { return w.filter(predicate) }

infix operator ‖: AdditionPrecedence
func ‖ (w1: [Int], w2: [Int]) -> [Int] { return  w1 + w2 }

func q(_ w: [Int]) -> [Int] { return 1 >= ⍴w ? w : q(⤚w¦{x in x < ⚀w}) ‖ [⚀w] ‖ q(⤚w¦{x in x >= ⚀w}) }

//Test
print(q([9,9,9,8,7,6,4,4]))
