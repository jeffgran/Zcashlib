import Librustzcash
import Foundation

class Equihash {
    static func is_valid_solution(n: UInt32, k: UInt32, input: Data, nonce: Data, solution: Data) -> Bool {
        return input.withUnsafeBytes({ inputPointer in
            return nonce.withUnsafeBytes({ noncePointer in
                return solution.withUnsafeBytes({ solutionPointer in
                    return librustzcash_eh_isvalid(
                        n,
                        k,
                        inputPointer,
                        input.count,
                        noncePointer,
                        nonce.count,
                        solutionPointer,
                        solution.count)
                })
            })
        })

    }
}
