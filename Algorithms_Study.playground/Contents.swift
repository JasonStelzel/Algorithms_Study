// ---> BASIC FIBONACCI SERIES SOLVER

func fib (_ n: Int) -> Int {
    if (n <= 2) { return 1 }
    return fib(n - 1) + fib(n - 2)
}

print(fib(6))
print(fib(7))
print(fib(8))
//print(fib(50)) // this one will take too long -- enable it separately if you would like to see Xcode repeat work it has already done, coming across the same calculations on its way up to 50, desperately trying to complete the same calculations over and over and over again, essentially making it look like it's hung because it will take forever...





