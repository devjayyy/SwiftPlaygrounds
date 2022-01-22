func solution(_ arr:[Int]) -> Double {
    var sum : Int = 0
    for value in arr {
        sum += value
    }
    let average : Double = Double(sum) / Double(arr.count)
    return average
}

func solution2(_ arr:[Int]) -> Double {
    return Double(arr.reduce(0,+))/Double(arr.count)
}

let array : [Int] = [5,5]

print(solution(array))
print(solution(array2))

