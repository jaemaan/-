import Foundation

import Foundation

protocol AbstractOperation {
    func execute(_ a: Int, _ b: Int) -> Int?
}

class AddOperation: AbstractOperation {
    func execute(_ a: Int, _ b: Int) -> Int? {
        return a + b
    }
}

class SubtractOperation: AbstractOperation {
    func execute(_ a: Int, _ b: Int) -> Int? {
        return a - b
    }
}

class MultiplyOperation: AbstractOperation {
    func execute(_ a: Int, _ b: Int) -> Int? {
        return a * b
    }
}

class DivideOperation: AbstractOperation {
    func execute(_ a: Int, _ b: Int) -> Int? {
        if b == 0 {
            print("0으로 나눌 수 없습니다.")
            return nil
        }
        return a / b
    }
}

class RemainderOperation: AbstractOperation {
    func execute(_ a: Int, _ b: Int) -> Int? {
        if b == 0 {
            print("0으로 나머지 연산을 할 수 없습니다.")
            return nil
        }
        return a % b
    }
}

class Calculator {
    private let operations: [String: AbstractOperation] = [
        "+": AddOperation(),
        "-": SubtractOperation(),
        "*": MultiplyOperation(),
        "/": DivideOperation(),
        "%": RemainderOperation()
    ]
    
    func calculate(operator op: String, firstNumber a: Int, secondNumber b: Int) -> Int? {
        guard let operation = operations[op]
        else { print("지원하지 않는 연산자 '\(op)' 입니다.")
            return nil
        }
        return operation.execute(a, b)
    }
}


let calculator = Calculator()

if let result = calculator.calculate(operator: "%", firstNumber: 21, secondNumber: 0) {
    print("\(result)")
} else {
    print("연산 실패")
}
