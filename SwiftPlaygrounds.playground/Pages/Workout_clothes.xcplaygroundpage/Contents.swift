//전체 학생의 수 n,
//체육복을 도난당한 학생들의 번호가 담긴 배열 lost,
//여벌의 체육복을 가져온 학생들의 번호가 담긴 배열 reserve
//체육수업을 들을 수 있는 학생의 최댓값을 return

//  reserve에 있는 번호랑 lost에 있는 번호가 겹칠 경우 -> 빌려줄 수 없음
//여벌 체육복을 가져온 학생이 체육복을 도난당했을 수 있습니다.
//이때 이 학생은 체육복을 하나만 도난당했다고 가정하며,
//남은 체육복이 하나이기에 다른 학생에게는 체육복을 빌려줄 수 없습니다.

//둘 다 여분이 있으면 앞 사람 옷을 빌림
import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var lostSet = Set(lost).subtracting(reserve).sorted()//겹치면 빌려줄 수 없으므로
    // 정렬되어 있지 않은 경우 정렬해야 함
    let reserveSet = Set(reserve).subtracting(lost).sorted()
        
        for reserve in reserveSet {
            if lostSet.contains(reserve - 1) {      // 내 앞 번호 학생이 체육복이 없는지 확인
                let index = lostSet.firstIndex(of: reserve - 1)
                lostSet.remove(at: index!)
                continue

            }
            if lostSet.contains(reserve + 1) {      // 내 뒤 번호 학생이 체육복이 없는지 확인
                let index = lostSet.firstIndex(of: reserve + 1)
                lostSet.remove(at: index!)
            }
        }
    print(lostSet)
    return (n - lostSet.count)
    
}

let n = 6
var lost = [3,1,5]
let reserve = [6,4,2]
print(solution(n, lost, reserve))
