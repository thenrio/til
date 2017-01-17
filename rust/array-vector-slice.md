array : size is known at compile time
type is [T; N]
(see std::array)

    let a = [1, 2, 3]; // a: [i32; 3]

vector : size is dynamic
type is Vec<T>
(see std::vec)

    let a = vec![1,2,3]

slice :  dynamic view of a contiguous sequence of T
type is &[T]
(see std::slice)

    let s = &a[..]
    let t = &a

> can have slice of array of vector.

use &mut to have a mutable slice

    let a = vec![1,2,3]
    let s = &mut a[..]
