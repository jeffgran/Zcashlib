import XCTest
@testable import Zcashlib

final class ZcashlibTests: XCTestCase {
    static var allTests = [
        ("testEquihashIsValid", testEquihashIsValid),
    ]
    
    // test case copied from rust test
    func testEquihashIsValid() {

        //let input = b"block header";
        let input = "block header".data(using: .ascii)!
        
        // let mut nonce = [0 as u8; 32];
        let nonce = Data([UInt8](repeating: 0, count: 32))
        
        // I don't have a way to convert these [UInt32] indices to the [UInt8] that the public interface needs!
        //let mut indices = vec![
        //    976, 126621, 100174, 123328, 38477, 105390, 38834, 90500, 6411, 116489, 51107, 129167,
        //    25557, 92292, 38525, 56514, 1110, 98024, 15426, 74455, 3185, 84007, 24328, 36473,
        //    17427, 129451, 27556, 119967, 31704, 62448, 110460, 117894,
        //];
        let solution = Data()
        
        // should be invalid because we aren't passing real indices
        XCTAssert(!Equihash.is_valid_solution(n: 96, k: 5, input: input, nonce: nonce, solution: solution))
    }
    
}
