//
//
// PRACTICES
//
//


/*
 import UIKit
 
 // 2024/02/05
 // NUMBER 1.
 func prac1 (varString :String) -> String {
 var cad: Int = 0
 
 //    if varString.isEmpty {
 //        cad = 0
 //    }
 //    else {
 //        cad = 1
 //    }
 
 if varString.count % 2 == 0  {
 cad = 0
 }
 else {
 cad = 1
 }
 
 if cad == 0
 {
 return "Tienes " + String(varString.count) + " characteres, also is EVEN"
 }
 return "Tienes " + String(varString.count) + " characteres, also is ODD"
 }
 
 print(prac1(varString: ""))
 print(prac1(varString: "Hola"))
 print(prac1(varString: "Vic"))
 
 // 2024/02/05
 // NUMBER 2.
 func prac1 (varString :String) -> Bool {
 
 if varString.count % 2 != 0  {
 return true
 }
 else {
 return false
 }
 }
 
 print(prac1(varString: ""))
 print(prac1(varString: "Hola"))
 print(prac1(varString: "Vic"))
 
 // 2024/02/05
 // NUMBER 3.
 
 // NUMBER 2.
 func prac1 (varString :String) -> Bool {
 
 //5.
 //    let temp = ["123", "-1", "0", nil, "7.5"]
 //    var sum: Double = 0
 //
 //    for cve in temp
 //    {
 //        sum += Double(cve ?? "") ?? 0
 //    }
 //    print(sum)
 //
 //    if varString.count % 2 != 0  {
 //        return true
 //    }
 //    else {
 //        return false
 //    }
 
 //6.
 //    var left: String = "ABC"
 //    var right: String = "+-"
 //    var final = ""
 //
 //    for word in left {
 //        for sec in right {
 //            final.append(word)
 //            final.append(sec)
 //        }
 //    }
 //    print(final)
 
 // 7.
 //    var s = "ABC"
 //    var vec : Int = 5
 //    var res = ""
 //
 //    for letra in s
 //    {
 //        for i in 0...vec
 //        {
 //            res.append(letra)
 //        }
 //    }
 
 // 8.
 //    let l = [0,2,4,6,4,7,7]
 //    var f = [Int]()
 //    var x = 0
 //    f.append(l[0])
 //    for i in l {
 //
 //        x += 1
 //        print(i,x)
 //        if (x >= l.count) {break}
 //        print(i,x,l[x])
 //        if (i <= l[x])
 //        {
 //            f.append(l[x])
 //        }
 //    }
 //    print(f)
 //    print("X")
 return true
 }
 
 //"ABC".reduce(""){
 //    return $0+String($1)+String($1)+String($1)+String($1)
 //}
 
 print(prac1(varString: "Lalo"))
 print(prac1(varString: "Lol"))
 
 //9.
 //func desc(l: [Int]) -> [Int] {
 //
 //    if l.count < 2
 //    {
 //        return l
 //    }
 //
 //    var curr = l[0]
 //    var nlist = [Int]()
 //
 //    for i in 1..<l.count
 //    {
 //        print(curr,l[i])
 //        if curr > l[i]
 //        {
 //            curr = l[i]
 //        }
 //        else
 //        {
 //            nlist.append(l[i])
 //        }
 //        print(nlist)
 //    }
 //
 //    return nlist
 //}
 //print(desc(l:[]))
 //print(desc(l: [7,7,4,6,4,0,2]))
 
 // 10. - 3 with reduce - suma todos los enteros no negativos
 //func ten(l: [String]) -> Int {
 //
 //    print(l.reduce(0, {(p,s) -> UInt in p + (UInt(s ?? "") ?? 0)}))
 //
 //    return 1
 //}
 //
 //print(ten(l: ["123","456.7","0","-1","Testing","887"]))
 //
 //// 11. - 4 with reduce
 //func eleven(l: [String]) -> Int {
 //
 //    print(l.reduce(0.0, {(p,s) -> Double in p + (Double(s ?? "") ?? 0)}))
 //
 //    return 1
 //}
 //
 //print(eleven(l: ["123","456.7","0","-1","Testing","887"]))
 
 // 12. - 5 with reduce - suma todos los enteros
 //func twelve(l: [String]) -> Int {
 //
 //    print(l.reduce(0, {(p,s) -> Int in p + (Int(s ?? "") ?? 0)}))
 //
 //    return 1
 //}
 //
 //print(twelve(l: ["123","456.7","0","-1","Testing","887"]))
 
 */

//25. Te da el valor de la suma siempre y cuando no sea = al numero , en este caso 15
//func equalSums(total: Int, square: [[Int]]) -> [String:Int] {
//    var errorDict = [String:Int]()
//    let numSquares = square.count
//
//    for i in 0..<numSquares {
//        var rowSubtotal = 0
//        var colSubtotal = 0
//        for j in 0..<numSquares {
//            rowSubtotal += square[i][j]
//            colSubtotal += square[j][i]
//        }
//        if total != rowSubtotal {
//            errorDict["Row \(i)"] = rowSubtotal
//        }
//        if total != colSubtotal {
//            errorDict["Column \(i)"] = colSubtotal
//        }
//    }
//    return errorDict
//}
//
//print(equalSums(total: 15, square: [[8,1,6],[3,5,7],[4,9,2]]))
//print(equalSums(total: 15, square: [[8,0,6],[3,5,7],[5,9,2]]))

//26.return row or column with same letter
//func allOs(square: [[Character]]) -> [String:Int] {
//    var resultDict = [String:Int]()
//    let numSquares = square.count
//
//    for i in 0..<numSquares {
//        var rowSubtotal = 0
//        var colSubtotal = 0
//        for j in 0..<numSquares {
//            rowSubtotal += square[i][j] == "o" ? 1 : 0
//            colSubtotal += square[j][i] == "o" ? 1 : 0
//        }
//        if numSquares == rowSubtotal {
//            resultDict["Row \(i)"] = rowSubtotal
//        }
//        if numSquares == colSubtotal {
//            resultDict["Column \(i)"] = colSubtotal
//        }
//    }
//    return resultDict
//}
//print(allOs(square: [["o","o","o"],["x", "o", "x"], ["x", "o", "x"]]))
//print(allOs(square: [["o","x","o"],["x", "o", "x"], ["x", "o", "x"]]))


//func allNumbersInRange(array: [Int]) -> Bool {
//    var tally: [Int : UInt] = [:]
//    
//    for i in array {
//        tally[i, default: 0] += 1
//    }
//    
//    print(tally)
//    print(array)
//    
//    for i in 1...array.count {
//        if tally[i] != 1 {
//            return false
//        }
//    }
//    return true
//}
//allNumbersInRange(array: [4,3,2,6,5,1])
//allNumbersInRange(array: [4,3,2,7,5,1])
//allNumbersInRange(array: [4,3,2,5,1,1])

//func divisibleBy(a1: [Int], a2: [Int]) -> Bool {
//    
//    if a1.count != a2.count
//    {
//        return false
//    }
//    
//    for i in 0..<a1.count
//    {
//        print(a1[i])
//        print(a2[i])
//    
//        if (a1[i] / a2[i]) % 2 == 0
//        {
//            return true
//        }
//    
//    }
//    
//    return false
//}
//
//print(divisibleBy(a1: [10,36,12,2], a2: [2,4,6,2]))
//print(divisibleBy(a1: [8,8,12,22], a2: [2,4,6]))

//func reduc(l: [Int]) -> Int {
//    
//    let count = l.reduce(0) { (cnt, current) -> Int in
//        if (current != 0) { cnt + current } else { cnt - current }
//    }
//
//    return count
//}
//
//
//print(reduc(l: [1,2,3,4]))
	
