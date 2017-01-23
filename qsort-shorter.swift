prefix operator ⍴
prefix func ⍴(w: [Int]) -> Int { return w.count }

prefix operator ⚀
prefix func ⚀(w: [Int]) -> Int { return w[0] }

infix operator ¦
func ¦ (w: [Int], predicate: (Int)->Bool) -> [Int] { return w.filter(predicate) }

func q(_ w: [Int]) -> [Int] { return 1 >= ⍴w ? w : q(w¦{x in x < ⚀w}) + (w¦{x in x == ⚀w}) + q(w¦{x in x > ⚀w}) }

//Test
print(q([9,9,9,8,7,6,4,4]))
