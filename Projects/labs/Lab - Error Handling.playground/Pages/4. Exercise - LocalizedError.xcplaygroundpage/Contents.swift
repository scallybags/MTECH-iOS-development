/*:
## Exercise - LocalizedError
 
 A better approach to the previous exercise might be using the LocalizedError protocol, so that the printed output of each error is contained in a `errorDescription` property. Using the error messages you created in the last step, change `CommunicationError` to conform to `LocalizedError`. Add an `errorDescription` computed String property, switching on self to return the appropriate message.
 */
import SwiftUI
enum CommunicationError: LocalizedError {
    case networkServiceUnavailable
    case invalidMessage
    case timedOut(Int)
    case cancelledByUser
    case rejectedByServer
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .networkServiceUnavailable:
            return "Network Service Unavailable"
        case .invalidMessage:
            return "Invalid Message"
        case .timedOut(let time):
            return "Timed Out after \(time)"
        case .cancelledByUser:
            return "Cancelled By User"
        case .rejectedByServer:
            return "Rejected by Server: you are a bot."
        case .unknown:
            return "Unknown Error"
        }
    }
}

func sendPacket() throws {
    let randomNumber = Int.random(in: 0..<6)
    print("random number: \(randomNumber)")
    switch randomNumber {
    case 0:
        throw CommunicationError.networkServiceUnavailable
    case 1:
        throw CommunicationError.invalidMessage
    case 2:
        throw CommunicationError.timedOut(10)
    case 3:
        throw CommunicationError.cancelledByUser
    case 4:
        throw CommunicationError.rejectedByServer
    default:
        throw CommunicationError.unknown
    }
}

/*:
 Now, use only one catch block below to catch all errors, printing the error's `errorDescription` to the console. Test your code several times.
 */

do {
    try sendPacket()
} catch {
    let errorMessage = error.localizedDescription
    print(errorMessage)
}

/*:
 _Copyright © 2023 Apple Inc._

 _Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:_

 _The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software._

 _THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE._
 
[Previous](@previous)  |  page 4 of 4
 */
