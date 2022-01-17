//인형뽑기 게임
import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var result = [Int]() //뽑힌 인형 배열에 넣기
    var b = board // board는 상수니까 변수 b에 다시 넣기 그래야 0으로 만들 수 있음
    var count = 0
    //인형 뽑기 로직
    for col in moves {
        for row in 0..<b.count {
            if b[row][col-1] != 0 {
                if result.count > 0 && b[row][col-1] == result[result.endIndex-1] {
                    result.removeLast() //똑같은 인형이면 뽑힌 인형에서 빼기
                    count += 1
                }
                else {
                    result.append(b[row][col-1])
                }
                b[row][col-1] = 0
                break
            }
        }
    }
    print(result)
    
    return count * 2
}

let board = [[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]]
let moves = [1,5,3,5,1,2,1,4]

print(solution(board, moves))
