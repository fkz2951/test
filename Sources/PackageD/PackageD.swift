#if os(Linux)
import Glibc
#else
import Darwin.C
#endif
import Algorithms

public extension MutableCollection where Index == Int {
    mutating func shuffle() {
        if count <= 1 { return }

        for i in 0 ..< count - 1 {
            #if os(Linux)
            let j = Int(random() % (count - 1)) + i
            #else
            let j = Int(arc4random_uniform(UInt32(count - 1))) + 1
            #endif
            swapAt(i, j)
        }
    }
}
