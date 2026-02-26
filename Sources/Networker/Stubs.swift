import Foundation

class BaseUrl {
    static let shared = BaseUrl()
    var apiBaseURL: String = "https://mintoakapp.mintoak.com/"
    var swiftieBaseURL: String = "https://swiftie.net/"
    var swiftiePathURL: String = "ExternalMicroservice/api/Account/AuthenticateUser"
    var kAES_SecretKey: String = "IuQVdlrYAXSKyO2v7ae9cMNT0G1HhbWg"
    var isEncryptionEnable: Bool = true
    var isPinned: Bool = false
    let logEnabled: Bool = false //change flage for pinned changes
    var AES_CryptoHelperAgentId: String = "2speQPhzE5oIVaKuZF7DBglw3SmqrYCv"
    var AES_CryptoHelperClientSecretKey: String = "yE6wIKiNZQpxG9UkuLMTevz43s71Wqj5"
}

class Obfuscator {
    func reveal(key: [UInt8]) -> String {
        return String(bytes: key, encoding: .utf8) ?? ""
    }
}

let NumberOneData: [UInt8] = []
let NumberThreeData: [UInt8] = []
let NumberFourData: [UInt8] = []
let NumberFiveData: [UInt8] = []
let Number6Data: [UInt8] = []
let Number7Data: [UInt8] = []
let Number8Data: [UInt8] = []

import Foundation
import Darwin

func isSSLHooked() -> Int {
    let RTLD_DEFAULT = UnsafeMutableRawPointer(bitPattern: -2)
    guard let createTrustFunc = dlsym(RTLD_DEFAULT, "tls_helper_create_peer_trust") else {
        // Unable to find symbol, assume function is hooked.
        return 1
    }
    
    let createTrustFuncAddr = createTrustFunc.assumingMemoryBound(to: UInt32.self)
    
    // Verify if one of first three instructions is an unconditional branch
    // to register (BR Xn), unconditional branch with link to register
    // (BLR Xn), return (RET).
    for i in 0..<3 {
        let opCode = createTrustFuncAddr.advanced(by: i).pointee & 0xfffffc1f
        if opCode == 0xD61F0000 {
            // Instruction found, function is hooked.
            return 1
        }
    }
    
    // Function is not hooked through a trampoline.
    return 0
}

class AnalyticsUtilites {
    static let shared = AnalyticsUtilites()
    var sessionId: String = ""
    static func triggerAnalyticsEvent(event: String, screenName: String, identifier: String, element: String, action1: String, action2: String, myBundle: [String: Any]) {}
}
