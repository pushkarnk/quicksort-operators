prefix operator ⍴
prefix func ⍴<T>(w: [T]) -> Int { return w.count }

prefix operator ⚀
prefix func ⚀<T>(w: [T]) -> T { return w[0] }

infix operator ¦
func ¦<T>(w: [T], predicate: @escaping (T)->Bool) -> [T] { return w.filter(predicate) }

infix operator ‖: AdditionPrecedence 
func ‖<T>(w1: [T], w2: [T]) -> [T] { return w1 + w2 }

prefix operator ⤚
prefix func ⤚<T>(w: [T]) -> [T] { return Array(w[1..<w.count]) }

func q<T: Comparable>(_ w: [T]) -> [T] {return 1 >= ⍴w ? w : q(⤚w¦{x in x < ⚀w}) ‖ [⚀w] ‖ q(⤚w¦{x in x >= ⚀w})}

print(q([9,9,8,7,6,5,5]))
print(q(["IBM", "Apple", "Amazon", "IBM", "Microsoft"]))
