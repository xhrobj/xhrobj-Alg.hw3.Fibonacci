example(of: "Возведение числа в целую степень") {
    func pow(_ a: Int, _ n: Int) -> Int {
        guard n >= 0 else { return 0 }
        var result = 1
        for _ in 0..<n {
            result *= a
        }
        return result
    }
    
    print(pow(2, 0), pow(2, 1), pow(2, 2), pow(2, 3), pow(2, 4), pow(2, 5), pow(2, 6), pow(2, 7), pow(2, 8))
}

example(of: "Фибоначчи (итеративный)") {
    func fibonacci(_ n: Int) -> Int { // 0, 1, 1, 2, 3, 5, 8, 13, ...
        guard n > 0 else { return 0 }
        
        var a = 0, b = 1

        guard n > 1 else { return a }
        guard n > 2 else { return b }
        
        var result = 0
        for _ in 3...n {
            result = a + b; a = b; b = result
        }
        return result
    }
    
    print(fibonacci(7))
}

example(of: "Фибоначчи (рекурсивный)") {
    func fibonacci(_ n: Int) -> Int {
        guard n > 1 else { return 0 }
        guard n > 2 else { return 1 }
        
        return fibonacci(n - 1) + fibonacci(n - 2)
    }
    
    print(fibonacci(7))
}

example(of: "Решето Эратосфена") {
    func countPrimes(_ n: Int) -> Int {
        let limit = Int(Double(n).squareRoot())
        var sieve = Array(repeating: true, count: n)
        var result = 0
        for i in 2..<n {
            guard sieve[i] else { continue }
            result += 1
            guard i <= limit else { continue }
            for j in stride(from: i * i, to: n, by: i) {
                sieve[j] = false
            }
        }
        return result
    }

    print(countPrimes(100), countPrimes(5_000_000))
}
