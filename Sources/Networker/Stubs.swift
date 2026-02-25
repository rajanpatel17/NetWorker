import Foundation

class BaseUrl {
    static let shared = BaseUrl()
    var apiBaseURL: String = "https://api.example.com"
    var swiftieBaseURL: String = "https://swiftie.example.com"
    var swiftiePathURL: String = "/api/authenticate"
    var kAES_SecretKey: String = "stub_key"
    var isEncryptionEnable: Bool = false
    var isPinned: Bool = false
    var AES_CryptoHelperAgentId: String = "stub_agent"
    var AES_CryptoHelperClientSecretKey: String = "stub_secret"
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

class AnalyticsUtilites {
    static let shared = AnalyticsUtilites()
    var sessionId: String = ""
    static func triggerAnalyticsEvent(event: String, screenName: String, identifier: String, element: String, action1: String, action2: String, myBundle: [String: Any]) {}
}

func isSSLHooked() -> Int {
    return 0
}

/*#include "SSLHookCheck.h"
#include <dlfcn.h>

int isSSLHooked() {
    void* (*createTrustFunc)(void) = dlsym(RTLD_DEFAULT, "tls_helper_create_peer_trust");
    if(createTrustFunc == 0x0){
        // Unable to find symbol, assume function is hooked.
        return 1;
    }
    
    unsigned int * createTrustFuncAddr = (unsigned int *) createTrustFunc;
    
    // Verify if one of first three instructions is an unconditional branch
    // to register (BR Xn), unconditional branch with link to register
    // (BLR Xn), return (RET).
    for(int i = 0; i < 3; i++){
        int opCode = createTrustFuncAddr[i] & 0xfffffc1f;
        if(opCode == 0xD61F0000){
            // Instruction found, function is hooked.
            return 1;
        }
    }
    
    // Function is not hooked through a trampoline.
    return 0;
}
*/
