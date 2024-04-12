//
// Example using reduce
import SwiftUI

func evaluate(l: [Int]) -> String {
    let res = l.reduce(0) {
        print($0, $1)
        if $1 % 2 == 0 {
            return $0 + 1
        }
        return $0 - 1
    }
    switch res {
    case ..<0:
            return "ODD"
        case 0:
            return "Balanced"
        default:
            return "EVEN"
    }
}
print(evaluate(l: [0,1,2,3]))
print(evaluate(l: [0,1,1,1,9,98]))
print(evaluate(l: [0,2,4,5]))


