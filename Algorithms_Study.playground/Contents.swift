//// ---> BASIC FIBONACCI SERIES SOLVER
//
//func fib (_ n: Int) -> Int {
//    if (n <= 2) { return 1 }
//    return fib(n - 1) + fib(n - 2)
//}
//
//print(fib(6))
//print(fib(7))
//print(fib(8))
////print(fib(50)) // this one will take too long -- enable it separately if you would like to see Xcode repeat work it has already done, coming across the same calculations on its way up to 50, desperately trying to complete the same calculations over and over and over again, essentially making it look like it's hung because it will take forever...





//// ---> FIXING BASIC FIBONACCI SERIES SOLVER WITH MEMOIZATION (BUT THERE'S A PROBLEM)
//// The red Xcode error that shows up when you enable this codes stems from the fact that the "memo" object (a dictionary of Ints, keyed by Ints) is implemented as a Struct within Swift which is passed by value as a "let" constant, meaning it cannot be instantiated inside the called function (because the function has already been called and includes a reference to an object which doesn't exist yet) nor can it be added to, because even if it were inside there, you would be modifying a COPY of this dictionary, not the orignal (as the default method of passing Structs in Swift is to pass by value, not by reference).  So it needs to be created somewhere else in advance if it doesn't exist so that it can be passed into this function by reference using a pointer to its address (wherever it actually lives) and we do this by indicating it as an "inout" type which you will see in the next example.
//// See the next code example for this fix.
//
//func fibMemoLetError (_ n: Int, _ memo: [Int:Int] = [:]) -> Int {
//    if (memo.keys.contains(n)){ return memo[n]! }
//    if (n <= 2) {return 1}
//
//    memo[n] = fibMemoLetError(n - 1, memo) + fibMemoLetError(n - 2, memo)
//    return memo[n]!
//}
//
//print(fibMemoLetError(6))
//print(fibMemoLetError(7))
//print(fibMemoLetError(8))
////print(fibMemoLetError(50)) // this one wouldn't take too long (if this code worked)






