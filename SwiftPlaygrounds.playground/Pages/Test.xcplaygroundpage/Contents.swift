//그 순서에 해당하는 값이 있어야 함.
import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let student1:[Int] = [1,2,3,4,5] //1번의 반복적인 패턴
    let student2:[Int] = [2,1,2,3,2,4,2,5] //2번의 반복적인 패턴
    let student3:[Int] = [3,3,1,1,2,2,4,4,5,5] //3번의 반복적인 패턴
    var result = [Int]()//빈 배열 선언
    var count1 = 0
    var count2 = 0
    var count3 = 0
    
    for i in 0..<answers.count {
        if answers[i] == student1[i%5] {
            count1 += 1
        }
        if answers[i] == student2[i%8] {
            count2 += 1
        }
        if answers[i] == student3[i%10] {
            count3 += 1
        }
        
    }
    print(count1)
    print(count2)
    print(count3)

    switch (count1, count2) { //switch 사용해보기
    case (count2, count3): //셋이 점수가 같음
        result = [1,2,3]
    case (count2, _) where count1 > count3: //학생1, 학생2가 점수 같고 max 임
        result = [1,2]
    case (count2, _) where count1 < count3: //학생3이 max
        result = [3]
    case (count3, _) where count1 > count2: //학생1, 학생3가 점수 같고 max 임
        result = [1,3]
    case (count3, _) where count1 < count2: //학생2가 max
        result = [2]
    case (_, count3) where count3 > count1: //학생2, 학생3가 점수 같고 max 임
        result = [2,3]
    case (_, count3) where count3 < count1: //학생1이 max
        result = [1]
    default: //셋 다 점수가 다름
        let array : [Int] = [count1, count2, count3]
        result = [array.firstIndex(of:array.max()!)! + 1]
    }
    
    return result
}

let answers:[Int] = [3,3,1,1,2,2]

print(solution(answers))
