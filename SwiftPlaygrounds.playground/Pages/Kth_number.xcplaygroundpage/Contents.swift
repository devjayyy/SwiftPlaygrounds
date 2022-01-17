import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var newArr = array
    var result = [Int]()//결과 배열
    
    for i in 0..<commands.count { //for in loop 활용
        if commands[i][0] == commands[i][1] { //만약 1개만 자르려면
            result.append(newArr[commands[i][0]-1]) //그 순서에 해당하는 newArr의 값을 바로 append
        }
        else { //2개 이상이면
            var slice = newArr[commands[i][0]-1...commands[i][1]-1] //slice해줌. 참조?
            //print(slice)
            var sortedArr = slice.sorted() //slice를 정렬해줌
            //print(sortedArr) //
            result.append(sortedArr[commands[i][2]-1]) //정렬된 slice에서 원하는 순서의 값을 찾아서 append
        }
    }
    
    return result
}

var array : [Int] = [1, 5, 2, 6, 3, 7, 4]
var commands :[[Int]] = [[2, 5, 3], [4, 4, 1], [1, 7, 3]]

print(solution(array, commands))
