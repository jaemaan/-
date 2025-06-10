//
//  main.swift
//  Projcet
//
//  Created by 김재만 on 6/10/25.
//

import Foundation

print("< 게임을 시작합니다 >")

func makeAnswer() -> [Int] {
    return Array((1...9).shuffled().prefix(3))
}

func validateInput(_ input: String) -> Bool {
    guard input.count == 3 else { return false }
    guard input.allSatisfy({ $0.isNumber }) else { return false }

    let digits = input.compactMap { Int(String($0)) }

    let hasZero = digits.contains(0)
    let hasDuplicates = Set(digits).count != 3

    return !hasZero && !hasDuplicates
}

func getHint(userInput: [Int], answer: [Int]) -> (strike: Int, ball: Int) {
    var strike = 0
    var ball = 0

    for (i, num) in userInput.enumerated() {
        if num == answer[i] {
            strike += 1
        } else if answer.contains(num) {
            ball += 1
        }
    }

    return (strike, ball)
}

let answer = makeAnswer()


while true {
    print("\n숫자를 입력하세요")
    
    guard let input = readLine() else {
        print("입력이 올바르지 않습니다.")
        continue
    }

    guard validateInput(input) else {
        print("올바르지 않은 입력값입니다")
        continue
    }

    let userNumbers = input.compactMap { Int(String($0)) }
    let (strike, ball) = getHint(userInput: userNumbers, answer: answer)

    if strike == 3 {
        print("🎉 정답입니다! 게임을 종료합니다.")
        break
    }

    if strike == 0 && ball == 0 {
        print("Nothing")
    } else {
        print("\(strike)스트라이크 \(ball)볼")
    }
}

