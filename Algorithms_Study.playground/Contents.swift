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






// ---> BASIC FIBONACCI SERIES SOLVER WITH MEMOIZATION SOLUTION
// This solution breaks up the code into two similarly-named functions with different signatures because it turns out, if you use the "inout" modifier in Swift to pass a dictionary by reference, you cannot have a default value for a non-supplied dictionary argument (as you start this call without a dictionary and it is normally instantiated as needed by the fib function itself in other languages). Mark any references to the dictionary with the address symbol "&" to indicate that a pointer to the one and only &memo object is moving into and out of the function. Also, the function declaration marks the argument with "inout" right before the type to show that it expects it to pass into and back out of the function by reference. Then, when the fibByReference() function is called with a single Int to start, the function that matches that signature will be called the first time, a memo dictionary will be generated so that when the 2nd call to this function is made, it will include the necessary 2nd argument -- a memo dictionary. After that point, all subsequent calls will use the function with 2 arguments because the memo dictionary will continue to exist between recursive calls of the 2nd function.

func fibMemoByReference (_ n: Int) -> Int { // function having a signature with only 1 Int argument
    var memo =  [Int:Int]()
    return fibMemoByReference(n, &memo)
}

func fibMemoByReference (_ n: Int, _ memo: inout [Int:Int]) -> Int { // same function name, different signature, with both arguments, the original Int plus the memo dictionary generated from the first function.
    if (memo.keys.contains(n)){ return memo[n]! }
    if (n <= 2) {return 1}

    memo[n] = fibMemoByReference(n - 1, &memo) + fibMemoByReference(n - 2, &memo)
    return memo[n]!
}

print(fibMemoByReference(6))
print(fibMemoByReference(7))
print(fibMemoByReference(8))
print(fibMemoByReference(50)) // Now runs as fast as the other 3, no problem!





