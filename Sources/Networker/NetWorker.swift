//
//  NetWorker.swift
//  NetWorker
//

import Foundation
import ObjectiveC
import Gzip
import TrustKit
import UIKit

class RuntimeClass {
    @objc dynamic func runtimeModifiedFunction()-> Int {
        return 1
    }
}

fileprivate let kAES_SecretKey = BaseUrl.shared.kAES_SecretKey
fileprivate let isEncryptionEnable = BaseUrl.shared.isEncryptionEnable
fileprivate let isPinned = BaseUrl.shared.isPinned
public class NetWorker: NSObject, URLSessionDelegate {
    
    // MARK: TrustKit Pinning Reference
    //    public func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
    //
    ////             Call into TrustKit here to do pinning validation
    //            if TrustKit.sharedInstance().pinningValidator.handle(challenge, completionHandler: completionHandler) == false {
    ////                 TrustKit did not handle this challenge: perhaps it was not for server trust
    ////                 or the domain was not pinned. Fall back to the default behavior
    //                completionHandler(.performDefaultHandling, nil)
    //            }
    //        }
    
    public static var sessionID: String? //{
    //        get {
    //            UserDefaults.standard.string(forKey: "sessionID") ?? ""
    //        } set {
    //            UserDefaults.standard.set(newValue, forKey: "sessionID")
    //        }
    //    }
    
    public static var isSessionExpired: Bool = false
    public static var isServerSessionExpired: Bool = false
    
    public static var deviceID = ""
    public static var fcmToken = ""
    public static var isShowNoInternet = true
    public static var isInvalidServer = true
    
    public var sessionTimeout: () -> () = {}
    public var showHud: () -> () = {}
    public var hideHud: () -> () = {}
    public var showMessageToUser: ((String) -> ())?
    //    public var showAlertMessage
    private var invalidDataRetryCounter: Int = 0
    //    private let apiProvider = MoyaProvider<OneAppAuth>(plugins: [NetworkLoggerPlugin()])
    
    func obfuscationFunction(_ input: UInt8) -> UInt8 {
        return input ^ 0x55
    }
    
    func deobfuscationFunction(_ input: UInt8) -> UInt8 {
        return input ^ 0x55
    }
    
    func ZAfrXCsS() {}
    
    func obfuscatedKey(forKey: Int) -> String {
        // Apply the obfuscation function to the original key parts
        let obfuscator = Obfuscator()
        var obfuscatedKeyPart1 = NumberOneData.map(obfuscationFunction)
        
        switch forKey {
        case 3:
            obfuscatedKeyPart1 = NumberThreeData.map(obfuscationFunction)
            break
        case 4:
            obfuscatedKeyPart1 = NumberFourData.map(obfuscationFunction)
            break
        case 5:
            obfuscatedKeyPart1 = NumberFiveData.map(obfuscationFunction)
            break
        case 6:
            obfuscatedKeyPart1 = Number6Data.map(obfuscationFunction)
            break
        case 7:
            obfuscatedKeyPart1 = Number7Data.map(obfuscationFunction)
            break
        case 8:
            obfuscatedKeyPart1 = Number8Data.map(obfuscationFunction)
            break
        default:
            obfuscatedKeyPart1 = NumberOneData.map(obfuscationFunction)
            break
        }
        
        // Deobfuscate and combine the key parts
        let deobfuscatedKeyPart1 = obfuscatedKeyPart1.map(deobfuscationFunction)
        let key1 = obfuscator.reveal(key: deobfuscatedKeyPart1)
        
        print("Converted String: \(key1)")
        return key1
    }
    
    /* func testWatchpoint() -> Bool{
     var ptr = malloc(9)
     var count = 3
     return IOSSecuritySuite.hasWatchpoint()
     }
     */
    func checkSecurityHooking() -> Bool {
        /*  let test = RuntimeClass.init()
         test.runtimeModifiedFunction()
         let dylds = ["UIKit"]
         
         let amIRuntimeHooked: Bool = IOSSecuritySuite.amIRuntimeHooked(dyldWhiteList: dylds, detectionClass: RuntimeClass.self, selector: #selector(RuntimeClass.runtimeModifiedFunction), isClassMethod: false)
         func msHookReturnFalse(takes: Int) -> Bool {
         /// add breakpoint at here to test `IOSSecuritySuite.hasBreakpointAt`
         return false
         }
         
         typealias FunctionType = @convention(thin) (Int) -> (Bool)
         func getSwiftFunctionAddr(_ function: @escaping FunctionType) -> UnsafeMutableRawPointer {
         return unsafeBitCast(function, to: UnsafeMutableRawPointer.self)
         }
         let funcAddr = getSwiftFunctionAddr(msHookReturnFalse)
         */
        
        /*   if IOSSecuritySuite.amIRunInEmulator() || IOSSecuritySuite.amIDebugged() || IOSSecuritySuite.hasBreakpointAt(funcAddr, functionSize: nil) || testWatchpoint() || IOSSecuritySuite.amIReverseEngineered() || IOSSecuritySuite.amIMSHooked(funcAddr)
         //|| amIRuntimeHooked || IOSSecuritySuite.amITampered([.bundleID("com.mintoak.hdfc")]).result {
         {
         status = true
         }
         */
        if !isPinned {
            return false
        }
        let result = isSSLHooked()
        if result == 1 {
            return true
        } else {
            print("SSL function is not hooked.")
            return false
        }
    }
    
    public init(alertCompletion: @escaping ((String) -> ())) {
        super.init()
        
        
        //        if self.checkSecurityHooking() {
        //            let alert = UIAlertController(title: "Alert!", message: "Your device is not secured", preferredStyle: .alert)
        //            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: {
        //                action in
        //                exit(0)
        //            }))
        //
        //            guard let vc = UIApplication.shared.keyWindow?.rootViewController else {
        //                return
        //            }
        //
        //            vc.present(alert, animated: true)
        //            return
        //        }
        
        self.showMessageToUser = alertCompletion
        //SSL Pining
        TrustKit.setLoggerBlock { (message) in
            print("TrustKit log: \(message)")
        }
        //uat-4.mintoak.com
        // smarthub.mintoak.com
        let trustKitConfigUAT = [
            kTSKSwizzleNetworkDelegates: false,
            kTSKPinnedDomains: [
                "uat-4.mintoak.com": [
                    kTSKEnforcePinning: true,
                    kTSKIncludeSubdomains: true,
                    //                    kTSKExpirationDate: "2024-12-01",
                    kTSKPublicKeyHashes: [
                        //                        "jQJTbIh0grw0/1TkHSumWb+Fs0Ggogr621gT3PvPKG0=",
                        //                        "Vjs8r4z+80wjNcr1YKepWQboSIRi63WsWXhIMN+eWys="
                        self.obfuscatedKey(forKey: 3),
                        self.obfuscatedKey(forKey: 4),
                        self.obfuscatedKey(forKey: 5)
                    ],
                ] as [String : Any]
            ]
        ] as [String : Any]
        
        // hdfcmmp.mintoak.com
        let trustKitConfigProduction = [
            kTSKSwizzleNetworkDelegates: false,
            kTSKPinnedDomains: [
                "hdfcmmp.mintoak.com" : [
                    kTSKEnforcePinning: true,
                    kTSKIncludeSubdomains: true,
                    //                    kTSKExpirationDate: "2024-12-01",
                    kTSKPublicKeyHashes: [
                        //                        "++MBgDH5WGvL9Bcn5Be30cRcL0f5O+NyoXuWtQdX1aI=",
                        //                        "f0KW/FtqTjs108NpYj42SrGvOB2PpxIVM8nWxjPqJGE=",
                        //                        "NqvDJlas/GRcYbcWE8S/IceH9cq77kg0jVhZeAPXq8k=",
                        //                        "9+ze1cZgR9KO1kZrVDxA4HQ6voHRCSVNz4RdTCx4U8U=",
                        //                        "KwccWaCgrnaw6tsrrSO61FgLacNgG2MMLq8GE6+oP5I="
                        self.obfuscatedKey(forKey: 4),
                        self.obfuscatedKey(forKey: 5),
                        self.obfuscatedKey(forKey: 6),
                        self.obfuscatedKey(forKey: 7),
                        self.obfuscatedKey(forKey: 8)
                    ],
                ]
            ]
        ] as [String : Any]
        
        if isPinned{
            //        #if DEBUG
            //        TrustKit.initSharedInstance(withConfiguration: trustKitConfigUAT)
            //        #else
            //            TrustKit.initSharedInstance(withConfiguration: trustKitConfigProduction)
            //        #endif
        }
        
    }
    /*
     func someFunction(takes: Int) -> Bool {
     return false
     }
     
     // Defining FunctionType : @convention(thin) indicates a “thin” function reference, which uses the Swift calling convention with no special “self” or “context” parameters.
     typealias FunctionType = @convention(thin) (Int) -> (Bool)
     
     // Getting pointer address of function we want to verify
     func getSwiftFunctionAddr(_ function: @escaping FunctionType) -> UnsafeMutableRawPointer {
     return unsafeBitCast(function, to: UnsafeMutableRawPointer.self)
     }
     */
    func showAlert(message: String) {
        if message != ""{
            if message == "Invalid server response."{
                AnalyticsUtilites.triggerAnalyticsEvent(event: "Something_went_wrong", screenName: "Networker", identifier: "errorPopup", element: "Something-went-wrong", action1: "", action2: "ok", myBundle: [:])
            }else if message == "No internet!"{
                AnalyticsUtilites.triggerAnalyticsEvent(event: "Connection_error", screenName: "Networker", identifier: "Connectionerror", element: "connection-error", action1: "", action2: "ok", myBundle: [:])
            }
            
            showMessageToUser?(message)
        }
    }
    
    /*func eWbNCSbe() -> Int {
     let createTrustFunc = dlsym(UnsafeMutableRawPointer(bitPattern: -2), "tls_helper_create_peer_trust")
     if createTrustFunc == nil {
     // Unable to find symbol, assume function is hooked.
     return 1
     }
     
     let createTrustFuncAddr = createTrustFunc!
     
     // Verify if one of first three instructions is an unconditional branch
     // to register (BR Xn), unconditional branch with link to register
     // (BLR Xn), return (RET).
     for i in 0..<3 {
     let opCode = createTrustFuncAddr.load(fromByteOffset: i*MemoryLayout<UInt32>.size, as: UInt32.self) & 0xfffffc1f
     if opCode == 0xD61F0000 {
     // Instruction found, function is hooked.
     return 1
     }
     }
     // Function is not hooked through a trampoline.
     return 0
     }*/
    
    private func requestFromAuthType(_ authType: AuthCustome) -> (request: URLRequest, key: String, iv: String) {
        
        let auth = convert(auth: authType)
        
        let key = auth.encryptionType == .RSA_AES ? randomString(length: 16) : kAES_SecretKey
        let iv = randomString(length: 16)
        
        let url = auth.fullURL
        let method = auth.method
        let params: Any = {
            if auth.params1.count == 0 {
                return isEncryptionEnable && auth.isRequestEncrypted
                ? (auth.encryptionType == .RSA_AES
                   ? RSA_AES_CryptoHelper.getPayload(forParams: auth.params, aesKey: key, aesIV: iv)
                   : AES_CryptoHelper.getPayload(forParams: auth.params, aesKey: key, aesIV: iv))
                : auth.params
            } else {
                return isEncryptionEnable && auth.isRequestEncrypted
                ? (auth.encryptionType == .RSA_AES
                   ? RSA_AES_CryptoHelper.getPayload1(forParams: auth.params1, aesKey: key, aesIV: iv)
                   : AES_CryptoHelper.getPayload1(forParams: auth.params1, aesKey: key, aesIV: iv))
                : auth.params1
            }
        }()
        let headers = auth.headers
        
        let body = (try? JSONSerialization.data(withJSONObject: params, options: [])) ?? Data()
        
        //        let payload = (params["PAYLOAD"] as? String ?? "").data(using: .utf8) ?? Data()
        //        let payloadBase64 = Data(base64Encoded: body) ?? Data()
        //        let payloadString = String(data: payloadBase64, encoding: .utf8) ?? ""
        //        let decrypted = CryptoHelper.decrypt(payload: payloadBase64, aesKey: key, aesIV: iv)
        //        let decyptedString = String(data: decrypted, encoding: .utf8) ?? String()
        //        print(decyptedString)
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.httpBody = body
        request.allHTTPHeaderFields = headers
        
        print("Endpoint - \(url)")
        print("Params - \(params)")
        print("Headers - \(request.allHTTPHeaderFields ?? [:])")
        
        return (request: request, key: key, iv: iv)
        //        return (request: request, key: "", iv: "")
    }
    
    public func callAPIService <T: Codable> (isShowLoader:Bool = true, type: AuthCustome, completion: @escaping (T?) -> Void) {
        if !isConnectionAvailable(){
            if NetWorker.isShowNoInternet{
                NetWorker.isShowNoInternet = false
                showAlert(message: "No internet!")
            }
        }else{
            
            let result = isSSLHooked()
            if result == 1 {
                return
            } else {
                print("SSL function is not hooked.")
            }
            
            //            if self.checkSecurityHooking() {
            //                let alert = UIAlertController(title: "Alert!", message: "Your device is not secured", preferredStyle: .alert)
            //                alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: {
            //                    action in
            //                   exit(0)
            //                }))
            //
            //                guard let vc = UIApplication.shared.keyWindow?.rootViewController else {
            //                    return
            //                }
            //
            //                vc.present(alert, animated: true)
            //                return
            //            }
            
            if RSA_AES_CryptoHelper.rsaPublicKey == ""{
                self.refreshAppKey {
                    NetWorker.isServerSessionExpired = false
                    self.callAPIService(type: type, completion: completion)
                }
            }
            
            let tuple = requestFromAuthType(type)
            let request = tuple.request
            let key = tuple.key
            let iv = tuple.iv
            if isShowLoader{
                self.showHud()
                print(" URL ===>> ", request.url)
            }
            // Unencrypted DB From Cache
            let configuration = URLSessionConfiguration.ephemeral
            configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
            configuration.urlCache?.removeAllCachedResponses()
            // change the default configuration
            // before creating the session
            let session = URLSession(configuration: configuration, delegate: self, delegateQueue: OperationQueue.main)
            session.dataTask(with: request) { (data, response, error) in
                DispatchQueue.global().async {
                    DispatchQueue.main.sync {
                        let httpResponseCode = (response as? HTTPURLResponse)?.statusCode
                        print(httpResponseCode)
                        if httpResponseCode == 401 {
                            if isShowLoader{
                                self.hideHud()
                            }
                            if !NetWorker.isSessionExpired{
                                NetWorker.isSessionExpired = true
                                NetWorker.sessionID = ""
                                self.sessionTimeout()
                            }
                            return
                        } else if httpResponseCode == 502 {
                            if isShowLoader{
                                self.hideHud()
                            }
                            print("Server Error ==>> ", response, "  ==== ", request)
                            self.showAlert(message: "Server Error")
                        }
                        if isEncryptionEnable{
                            if isShowLoader{
                                self.hideHud()
                            }
                            print("--- Entering Response ---")
                            let responseString = String(data: data ?? Data(), encoding: .utf8) ?? ""
                            
                            print(responseString)
                            
                            guard !responseString.isEmpty else {
                                if NetWorker.isServerSessionExpired {
                                    print("************************ Recall Api after generating New Key ***********************")
                                    self.callAPIService(type: type, completion: completion)
                                } else {
                                    self.showAlert(message: "Invalid server response.")
                                }
                                completion(nil)
                                return
                            }
                            
                            if let unencryptedResponse = try? JSONSerialization.jsonObject(with: responseString.data(using: .utf8) ?? Data(), options: []) as? [String: Any] {
                                let errorCode = unencryptedResponse["errorCode"] as? String
                                
                                if errorCode == "E105" {
                                    NetWorker.isServerSessionExpired = true
                                    self.refreshAppKey {
                                        NetWorker.isServerSessionExpired = false
                                        self.callAPIService(type: type, completion: completion)
                                    }
                                } else {
                                    if let respMessage = unencryptedResponse["respMessage"] as? String, !respMessage.isEmpty {
                                        self.showAlert(message: respMessage)
                                    }
                                }
                                completion(nil)
                            } else {
                                let data = responseString.data(using: .utf8) ?? Data()
                                let payloadBase64 = Data(base64Encoded: data) ?? Data()
                                let decrypted = RSA_AES_CryptoHelper.decrypt(payload: payloadBase64, aesKey: key, aesIV: iv)
                                var decompressedData = Data()
                                if decrypted.isGzipped {
                                    do {
                                        decompressedData = try decrypted.gunzipped()
                                        print(" decompressedData ===>>> ", decompressedData)
                                    } catch {
                                        print("decompressedData Error: \(error)")
                                    }
                                } else {
                                    decompressedData = decrypted
                                }
                                do  {
                                    
                                    let decodedData = try JSONDecoder().decode(T.self, from: decompressedData)
                                    print(" decompressedData 343432343===>>> ", decodedData)
                                    if isShowLoader{
                                        self.hideHud()
                                    }
                                    completion(decodedData)
                                } catch {
                                    print("Error : ",error)
                                    if isShowLoader{
                                        self.hideHud()
                                    }
                                    completion(nil)
                                }
                            }
                        }else{
                            if isShowLoader{
                                self.hideHud()
                            }
                            do  {
                                var decompressedData = Data()
                                if (data ?? Data()).isGzipped {
                                    do {
                                        decompressedData = try (data ?? Data()).gunzipped()
                                        print(" decompressedData ===>>> ", decompressedData)
                                    }
                                } else {
                                    print("--- Entering Response ---")
                                    let responseString = String(data: data ?? Data(), encoding: .utf8) ?? ""
                                    
                                    print(responseString)
                                    
                                    if responseString.isEmpty {
                                        if NetWorker.isServerSessionExpired{
                                            print("************************ Recall Api after genrating New Key ***********************")
                                            self.callAPIService(type: type, completion: completion)
                                        }else{
                                            print("Invalid server response.", response, "  ==== ", request)
                                            if !NetWorker.isInvalidServer{
                                                NetWorker.isInvalidServer = false
                                                self.showAlert(message: "Invalid server response.")
                                            }
                                        }
                                    }
                                    
                                    if let unencryptedResponse = try? JSONSerialization.jsonObject(with: responseString.data(using: .utf8) ?? Data(), options: []) as? [String: Any] {
                                        let errorCode = unencryptedResponse["errorCode"] as? String
                                        
                                        if errorCode == "E105" {
                                            NetWorker.isServerSessionExpired = true
                                            self.refreshAppKey {
                                                NetWorker.isServerSessionExpired = false
                                                self.callAPIService(type: type, completion: completion)
                                            }
                                        } else {
                                            decompressedData = data ?? Data()
                                        }
                                    }
                                }
                                let decodedData = try JSONDecoder().decode(T.self, from: decompressedData)
                                completion(decodedData)
                            } catch {
                                self.showAlert(message: "Something went wrong")
                                print("Error : ",error)
                                completion(nil)
                            }
                        }
                    }
                }
            }.resume()
        }
    }
    
    
    public func callAPIService (isShowLoader:Bool = true, type: AuthCustome, completion: @escaping (_ data: Data?, _ respose: URLResponse?, _ error: Error?) -> Void) {
        if !isConnectionAvailable(){
            if NetWorker.isShowNoInternet{
                NetWorker.isShowNoInternet = false
                showAlert(message: "No internet!")
            }
        }else{
            
            let result = isSSLHooked()
            if result == 1 {
                return
            } else {
                print("SSL function is not hooked.")
            }
            
            //            if self.checkSecurityHooking() {
            //                let alert = UIAlertController(title: "Alert!", message: "Your device is not secured", preferredStyle: .alert)
            //                alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: {
            //                    action in
            //                   exit(0)
            //                }))
            //
            //                guard let vc = UIApplication.shared.keyWindow?.rootViewController else {
            //                    return
            //                }
            //
            //                vc.present(alert, animated: true)
            //                return
            //            }
            
            if RSA_AES_CryptoHelper.rsaPublicKey == ""{
                self.refreshAppKey {
                    NetWorker.isServerSessionExpired = false
                    self.callAPIService(type: type, completion: completion)
                }
            }
            
            let tuple = requestFromAuthType(type)
            
            let request = tuple.request
            let key = tuple.key
            let iv = tuple.iv
            if isShowLoader{
                self.showHud()
            }
            // Unencrypted DB From Cache
            let configuration = URLSessionConfiguration.default
            configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
            // change the default configuration
            // before creating the session
            let session = URLSession(configuration: configuration)
            session.dataTask(with: request) { (data, response, error) in
                DispatchQueue.global().async {
                    DispatchQueue.main.sync {
                        let httpResponseCode = (response as? HTTPURLResponse)?.statusCode
                        if httpResponseCode == 401 {
                            if isShowLoader{
                                self.hideHud()
                            }
                            if !NetWorker.isSessionExpired{
                                NetWorker.isSessionExpired = true
                                NetWorker.sessionID = ""
                                AnalyticsUtilites.shared.sessionId = ""
                                self.sessionTimeout()
                            }
                            return
                        } else if httpResponseCode == 502 {
                            if isShowLoader{
                                self.hideHud()
                            }
                            print("Server Error ==>> ", response, "  ==== ", request)
                            self.showAlert(message: "Server Error")
                        }
                        
                        
                        print("--- Entering Response ---")
                        //                    let responseString = String(data: data ?? Data(), encoding: .utf8) ?? ""
                        let stringResponse = String(data: data ?? Data(), encoding: .utf8)
                        let base64Response = data?.base64EncodedString()
                        
                        let responseString = ((stringResponse ?? "").isEmpty ? base64Response : stringResponse) ?? ""
                        
                        print(responseString)
                        
                        if responseString.isEmpty {
                            if isShowLoader{
                                self.hideHud()
                            }
                            if NetWorker.isServerSessionExpired{
                                print("************************ Recall Api after genrating New Key ***********************")
                                self.callAPIService(type: type, completion: completion)
                            }else{
                                print("Invalid server response.", response, "  ==== ", request)
                                if !NetWorker.isInvalidServer{
                                    NetWorker.isInvalidServer = false
                                    self.showAlert(message: "Invalid server response.")
                                }
                            }
                        }
                        
                        if let unencryptedResponse = try? JSONSerialization.jsonObject(with: responseString.components(separatedBy: "==").last?.data(using: .utf8) ?? Data(), options: []) as? [String: Any] {
                            
                            let errorCode = unencryptedResponse["errorCode"] as? String
                            let respMessage = unencryptedResponse["respMessage"] as? String
                            let sessionExpCode = unencryptedResponse["statusCode"] as? String
                            let statusCode = unencryptedResponse["statusCode"] as? Int ?? 0
                            let message = unencryptedResponse["message"] as? String ?? ""
                            
                            if isShowLoader{
                                self.hideHud()
                            }
                            if errorCode == "E105" || sessionExpCode == "E105"{
                                NetWorker.isServerSessionExpired = true
                                self.refreshAppKey {
                                    NetWorker.isServerSessionExpired = false
                                    self.callAPIService(type: type, completion: completion)
                                }
                            } else if statusCode == 200 {
                                print("Swiftie Authenticate User \(message)")
                            } else {
                                self.showAlert(message: respMessage ?? "")
                            }
                            completion(data, response, error)
                        } else {
                            let data1 = responseString.data(using: .utf8) ?? Data()
                            
                            let payloadBase64 = Data(base64Encoded: data1) ?? Data()
                            
                            let decrypted = RSA_AES_CryptoHelper.decrypt(payload: payloadBase64, aesKey: key, aesIV: iv)
                            
                            if decrypted.count == 0 {
                                if isShowLoader{
                                    self.hideHud()
                                }
                                completion(data, response, error)
                            } else{
                                var decompressedData = Data()
                                if decrypted.isGzipped {
                                    do {
                                        decompressedData = try decrypted.gunzipped()
                                    } catch {
                                        print("decompressedData Error: \(error)")
                                    }
                                } else {
                                    decompressedData = decrypted
                                }
                                if isShowLoader{
                                    self.hideHud()
                                }
                                completion(decompressedData, response, error)
                            }
                        }
                    }
                }
            }.resume()
            
        }
    }
    
    public func refreshAppKey(completion: (() -> ())? = nil) {
        
        
        let result = isSSLHooked()
        if result == 1 {
            return
        } else {
            print("SSL function is not hooked.")
        }
        
        //        if self.checkSecurityHooking() {
        //            let alert = UIAlertController(title: "Alert!", message: "Your device is not secured", preferredStyle: .alert)
        //            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: {
        //                action in
        //               exit(0)
        //            }))
        //
        //            guard let vc = UIApplication.shared.keyWindow?.rootViewController else {
        //                return
        //            }
        //
        //            vc.present(alert, animated: true)
        //            return
        //        }
        
        let auth = OneAppAuth.getKey
        
        let url = auth.fullURL
        let method = auth.getMethod
        let headers = auth.headers
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.allHTTPHeaderFields = headers
        // Unencrypted DB From Cache
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        // change the default configuration
        // before creating the session
        let session = URLSession(configuration: configuration)
        session.dataTask(with: request) { (data, response, error) in
            
            DispatchQueue.global().async {
                DispatchQueue.main.sync {
                    
                    
                    if let httpResponse = response as? HTTPURLResponse {
                        print(httpResponse.statusCode)
                        if httpResponse.statusCode == 401 {
                            if !NetWorker.isSessionExpired{
                                NetWorker.isSessionExpired = true
                                NetWorker.sessionID = ""
                                AnalyticsUtilites.shared.sessionId = ""
                                self.sessionTimeout()
                            }
                        }
                    }
                    
                    let key = String(data: data ?? Data(), encoding: .utf8) ?? ""
                    RSA_AES_CryptoHelper.rsaPublicKey = key
                    print(" ****************  New Get Key *********************** \n",key)
                    
                    completion?()
                }
            }
            
            
            
        }.resume()
    }
    /*
     public func callAPIService <T: Codable> (type: Auth, completion: @escaping (T?, Result<Moya.Response, MoyaError>) -> Void) {
     
     let oneAppAuth = convert(auth: type)
     
     
     apiProvider.request(convert(auth: type)) { (result) in
     
     
     switch result {
     
     case .success(let data):
     var decrypted = oneAppAuth.isRequestEncrypted ? CryptoHelper.decrypt(payload: data.data) : data.data
     
     
     //                guard let decrypted = CryptoHelper.decrypt(payload: data.data) else {
     //                    return
     //                }
     
     let decoded  = try? JSONDecoder().decode(T.self, from: decrypted)
     
     let json = String(data: data.data, encoding: .utf8) ?? ""
     print(json)
     
     completion(decoded, result)
     
     case .failure:
     completion(nil, result)
     }
     
     }
     
     }
     public func callAPIService (type: Auth, completion: @escaping (String?, Result<Moya.Response, MoyaError>) -> Void) {
     
     let authType = convert(auth: type)
     apiProvider.request(authType) { (result) in
     
     switch result {
     
     case .success(let data):
     //                guard let decrypted = CryptoHelper.decrypt(payload: data.data) else {
     //                    return
     //                }
     
     let json = String(data: data.data, encoding: .utf8) ?? ""
     print(json)
     
     completion(json, result)
     
     case .failure:
     completion(nil, result)
     }
     
     }
     
     }
     
     public func refreshAppKey() {
     self.callAPIService(type: .getKey) { (key: String?, result) in
     CryptoHelper.rsaPublicKey = key ?? ""
     }
     }
     */
    func convert(auth: AuthCustome) -> AppAuth {
        switch auth {
        case .getKey:
            return OneAppAuth.getKey
        case .authMPos(terminalID: let terminalID):
            return OneAppAuth.authMPos(terminalID: terminalID)
        case .validateUser(let loginID, let appVersion, let devicePlatform):
            return OneAppAuth.validateUser(loginID: loginID, appVersion: appVersion, devicePlatform: devicePlatform)
        case .verifyOTP(let otp):
            return OneAppAuth.verifyOTP(otp: otp)
        case .resendOTP:
            return OneAppAuth.resendOTP
        case .verifyPin(let loginId, let authType, let mPIN, let fcmToken, let simID, let appInstanceId):
            return OneAppAuth.verifyPin(loginId: loginId, authType: authType, mPIN: mPIN, fcmToken: fcmToken, simID: simID, appInstanceId: appInstanceId)
        case .forgotPin(let loginId):
            return OneAppAuth.forgotPin(loginId: loginId)
        case .setAuth(let authType, let mPin, let isFaceEnabled, let isTouchEnabled):
            return OneAppAuth.setAuth(authType: authType, mPin: mPin, isFaceEnabled: isFaceEnabled, isTouchEnabled: isTouchEnabled)
        case .addUser(let userMobile, let userName, let userEmailID):
            return OneAppAuth.addUser(userMobile: userMobile, userName: userName, userEmailID: userEmailID)
        case .modifyUser(let userMobile, let userName, let userEmailID, let accountStatus):
            return OneAppAuth.modifyUser(userMobile: userMobile, userName: userName, userEmailID: userEmailID, accountStatus: accountStatus)
        case .addUserRole(let userMobile, let tidList):
            return OneAppAuth.addUserRole(userMobile: userMobile, tidList: tidList)
        case .modifyUserRole(let userMobile, let tidList):
            return OneAppAuth.modifyUserRole(userMobile: userMobile, tidList: tidList)
        case .getAPKUrl(let appVersion):
            return OneAppAuth.getAPKUrl(appVersion: appVersion)
        case .getUserProfile(loginID: let loginID):
            return OneAppAuth.getUserProfile(loginID: loginID)
        case .getUserProfileV2(loginID: let loginID):
            return OneAppAuth.getUserProfileV2(loginID: loginID)
            
        case .getUserRole:
            return OneAppAuth.getUserRole
        case .getUserTerminalList(let tids, let mids, let cids, let cities, let locations):
            return OneAppAuth.getUserTerminalList(tids: tids, mids: mids, cids: cids, cities: cities, locations: locations)
        case .paymentSalesCardMintoak(let terminalID, let salesCount, let startDate, let endDate):
            return OneAppAuth.paymentSalesCardMintoak(terminalID: terminalID, salesCount: salesCount, startDate: startDate, endDate: endDate)
        case .paymentSalesCardHDFC(let terminalID, let salesCount, let startDate, let endDate):
            return OneAppAuth.paymentSalesCardHDFC(terminalID: terminalID, salesCount: salesCount, startDate: startDate, endDate: endDate)
        case .payementModeAndLoyaltyAPI(let terminalID, let salesCount, let startDate, let endDate):
            return OneAppAuth.payementModeAndLoyaltyAPI(terminalID: terminalID, salesCount: salesCount, startDate: startDate, endDate: endDate)
        case .cashPay(terminalId: let terminalId, amount: let amount, description: let description, appTxnid: let appTxnid, plCustId: let plCustId, customerMobileNumber: let customerMobileNumber, redemptionId: let redemptionId):
            return OneAppAuth.cashPay(terminalId: terminalId, amount: amount, description: description, appTxnid: appTxnid, plCustId: plCustId, customerMobileNumber: customerMobileNumber, redemptionId: redemptionId)
        case .QRPay(terminalId: let terminalId, amount: let amount, description: let description, customerMobileNumber: let customerMobileNumber, appTxnid: let appTxnid, pgId: let pgId, plCustId: let plCustId, redemptionId: let redemptionId):
            return OneAppAuth.QRPay(terminalId: terminalId, amount: amount, description: description, customerMobileNumber: customerMobileNumber, appTxnid: appTxnid, pgId: pgId, plCustId: plCustId, redemptionId: redemptionId)
        case .LinkPay(terminalId: let terminalId, amount: let amount, description: let description, customerMobileNumber: let customerMobileNumber, appTxnid: let appTxnid, pgId: let pgId, plCustId: let plCustId, redemptionId: let redemptionId):
            return OneAppAuth.LinkPay(terminalId: terminalId, amount: amount, description: description, customerMobileNumber: customerMobileNumber, appTxnid: appTxnid, pgId: pgId, plCustId: plCustId, redemptionId: redemptionId)
        case .UPICollect(terminalId: let terminalId, amount: let amount, description: let description, customerMobileNumber: let customerMobileNumber, payerVpa: let payerVpa, appTxnid: let appTxnid, pgId: let pgId, plCustId: let plCustId, redemptionId: let redemptionId):
            return OneAppAuth.UPICollect(terminalId: terminalId, amount: amount, description: description, customerMobileNumber: customerMobileNumber, payerVpa: payerVpa, appTxnid: appTxnid, pgId: pgId, plCustId: plCustId, redemptionId: redemptionId)
        case .helpDesk:
            return OneAppAuth.helpDesk
        case .getHelpDeskDetails(terminalID: let terminalID):
            return OneAppAuth.getHelpDeskDetails(terminalID: terminalID)
        case .paymentModeGraphViewAll(tidList: let tidList, startDate: let startDate, endDate: let endDate):
            return OneAppAuth.paymentModeGraphViewAll(tidList: tidList, startDate: startDate, endDate: endDate)
        case .performanceViewAllWithDateRange(tidList: let tidList, startDate: let startDate, endDate: let endDate):
            return OneAppAuth.performanceViewAllWithDateRange(tidList: tidList, startDate: startDate, endDate: endDate)
        case .performanceViewAllWithServiceType(tidList: let tidList, serviceType: let serviceType):
            return OneAppAuth.performanceViewAllWithServiceType(tidList: tidList, serviceType: serviceType)
        case .miniStateMent(tidList: let tidList, type: let type, txnType: let txnType, serviceType: let serviceType, count: let count, startDate: let startDate, endDate: let endDate):
            return OneAppAuth.miniStateMent(tidList: tidList, type: type, txnType: txnType, serviceType: serviceType, count: count, startDate: startDate, endDate: endDate)
        case .merchantTxnDetail(tidList: let tidList, type: let type, txnType: let txnType, paymentType: let paymentType, startDate: let startDate, endDate: let endDate):
            return OneAppAuth.merchantTxnDetail(tidList: tidList, type: type, txnType: txnType, paymentType: paymentType, startDate: startDate, endDate: endDate)
        case .getFeedback(tidList: let tidList, startDate: let startDate, endDate: let endDate):
            return OneAppAuth.getFeedback(tidList: tidList, startDate: startDate, endDate: endDate)
        case .paymentModeSummary(tidList: let tidList, startDate: let startDate, endDate: let endDate):
            return OneAppAuth.paymentModeSummary(tidList: tidList, startDate: startDate, endDate: endDate)
        case .getFeedbackDetails(tidList: let tidList, startDate: let startDate, endDate: let endDate):
            return OneAppAuth.getFeedbackDetails(tidList: tidList, startDate: startDate, endDate: endDate)
        case .getComments(tidList: let tidList, startDate: let startDate, endDate: let endDate):
            return OneAppAuth.getComments(tidList: tidList, startDate: startDate, endDate: endDate)
        case .getPayLaterFunnel360(tidList: let tidList, startDate: let startDate, endDate: let endDate):
            return OneAppAuth.getPayLaterFunnel360(tidList: tidList, startDate: startDate, endDate: endDate)
        case .getPayLaterFunnelMMP(tidList: let tidList, startDate: let startDate, endDate: let endDate):
            return OneAppAuth.getPayLaterFunnelMMP(tidList: tidList, startDate: startDate, endDate: endDate)
        case .getPayLaterViewAll(tidList: let tidList, type: let type):
            return OneAppAuth.getPayLaterViewAll(tidList: tidList, type: type)
        case .getPayLaterCardDetail(tidList: let tidList, type: let type, since: let since):
            return OneAppAuth.getPayLaterCardDetail(tidList: tidList, type: type, since: since)
        case .getTxnDetailsMMP(tidList: let tidList):
            return OneAppAuth.getTxnDetailsMMP(tidList: tidList)
        case .getTxnDetails360(tidList: let tidList):
            return OneAppAuth.getTxnDetails360(tidList: tidList)
        case .getPLFunnelViewAllDetailsMMP(tidList: let tidList, since: let since):
            return OneAppAuth.getPLFunnelViewAllDetailsMMP(tidList: tidList, since: since)
        case .getIndividualPlTxns(tidList: let tidList, since: let since):
            return OneAppAuth.getIndividualPlTxns(tidList: tidList, since: since)
        case .getPLCustDetails360(tidList: let tidList, custId: let custId):
            return OneAppAuth.getPLCustDetails360(tidList: tidList, custId: custId)
        case .getPLCustDetailsMMP(tidList: let tidList, custIdGetPLTxns: let custIdGetPLTxns):
            return OneAppAuth.getPLCustDetailsMMP(tidList: tidList, custIdGetPLTxns: custIdGetPLTxns)
        case .resendReceipt(mtxnid: let mtxnid, msisdn: let msisdn):
            return OneAppAuth.resendReceipt(mtxnid: mtxnid, msisdn: msisdn)
        case .mobNumberViewAll(tidList: let tidList, startDate: let startDate, endDate: let endDate):
            return OneAppAuth.mobNumberViewAll(tidList: tidList, startDate: startDate, endDate: endDate)
        case .getStoreRatingData(tidList: let tidList, startDate: let startDate, endDate: let endDate):
            return OneAppAuth.getStoreRatingData(tidList: tidList, startDate: startDate, endDate: endDate)
        case .getStoreFeedbackComments(tidList: let tidList, startDate: let startDate, endDate: let endDate):
            return OneAppAuth.getStoreFeedbackComments(tidList: tidList, startDate: startDate, endDate: endDate)
        case .getTransactionReport(tidList: let tidList, startDate: let startDate, endDate: let endDate, sendEmail: let sendEmail):
            return OneAppAuth.getTransactionReport(tidList: tidList, startDate: startDate, endDate: endDate, sendEmail: sendEmail)
            //    case .generateTransactionReport(tidList: let tidList, startDate: let startDate, endDate: let endDate, sendEmail: let sendEmail, startHour: let startHour, endHour: let endHour, paymentType: let paymentType, transactionStates: let transactionStates):
            //        return OneAppAuth.generateTransactionReport(tidList: tidList, startDate: startDate, endDate: endDate, sendEmail: sendEmail, startHour: startHour, endHour: endHour, paymentType: paymentType, transactionStates: transactionStates)
        case .loyalty(mobile: let mobile, terminalId: let terminalId):
            return OneAppAuth.loyalty(mobile: mobile, terminalId: terminalId)
        case .getCustomer(customerMobile: let customerMobile, tid: let tid):
            return OneAppAuth.getCustomer(customerMobile: customerMobile, tid: tid)
        case .addPayLaterTxn(customerMobile: let customerMobile, tid: let tid, amount: let amount, address: let address, name: let name, description: let description, pgId: let pgId, isNew: let isNew):
            return OneAppAuth.addPayLaterTxn(customerMobile: customerMobile, tid: tid, amount: amount, address: address, name: name, description: description, pgId: pgId, isNew: isNew)
        case .getBadges(tidList: let tidList):
            return OneAppAuth.getBadges(tidList: tidList)
        case .bannerList:
            return OneAppAuth.bannerList
        case .mdrCharges:
            return OneAppAuth.mdrCharges
        case .businessCategory(location: let location):
            return OneAppAuth.businessCategory(location: location)
        case .plDayDetail(tidList: let tidList, startDate: let startDate, endDate: let endDate, type: let type):
            return OneAppAuth.plDayDetail(tidList: tidList, startDate: startDate, endDate: endDate, type: type)
        case .v2pTxnList(phoneNumber: let phoneNumber):
            return OneAppAuth.v2pTxnList(phoneNumber: phoneNumber)
        case .loanBlocks:
            return OneAppAuth.loanBlocks
        case .loanEligibility(amountID: let amountID, tenureID: let tenureID):
            return OneAppAuth.loanEligibility(amountID: amountID, tenureID: tenureID)
        case .swiftieAuthenticateUser(email: let email, phone: let phone, returnURL: let returnURL, serviceType: let serviceType, TID: let TID, pan: let pan, gstin: let gstin):
            return Swiftie.swiftieAuthenticateUser(email: email, phone: phone, returnURL: returnURL, serviceType: serviceType, TID: TID, pan: pan, gstin: gstin)
        case .LeaderBoard(tidList: let tidList, startDate: let startDate, endDate: let endDate):
            return OneAppAuth.LeaderBoard(tidList: tidList, startDate: startDate, endDate: endDate)
        case .ProductEnquiry(tid: let tid, cardNumber: let cardNumber, customerMsisdn: let customerMsisdn, prodType: let prodType, appRefId: let appRefId, txnid: let txnid):
            return OneAppAuth.ProductEnquiry(tid: tid, cardNumber: cardNumber, customerMsisdn: customerMsisdn, prodType: prodType, appRefId: appRefId, txnid: txnid)
        case .VeriFyOTP(tid: let tid, otp: let otp, customerMsisdn: let customerMsisdn, prodType: let prodType, appRefId: let appRefId):
            return OneAppAuth.VeriFyOTP(tid: tid, otp: otp, customerMsisdn: customerMsisdn, prodType: prodType, appRefId: appRefId)
        case .orderTrackList(tidList: let tidList):
            return OneAppAuth.orderTrackList(tidList: tidList)
        case .UPILink(terminalId: let terminalId, plCustId: let plCustId, amount: let amount, description: let description, customerMobileNumber: let customerMobileNumber, appTxnid: let appTxnid, pgId: let pgId, medium: let medium, redemptionId: let redemptionId):
            return OneAppAuth.UPILink(terminalId: terminalId, plCustId: plCustId, amount: amount, description: description, customerMobileNumber: customerMobileNumber, appTxnid: appTxnid, pgId: pgId, medium: medium, redemptionId: redemptionId)
        case .creditToBankCardList(tidList: let tidList, startDate: let startDate, endDate: let endDate):
            return OneAppAuth.creditToBankCardList(tidList: tidList, startDate: startDate, endDate: endDate)
        case .signUp(loginId: let loginId, deviceId: let deviceId, appVersion: let appVersion):
            return OneAppAuth.signUp(loginId: loginId,deviceId: deviceId, appVersion: appVersion)
        case .pinCodeMapper(pinCode: let pinCode):
            return OneAppAuth.pinCodeMapper(pinCode: pinCode)
        case .etbDOB(mobileNumber: let mobileNumber, dob: let dob):
            return OneAppAuth.etbDOB(mobileNumber: mobileNumber, dob: dob)
        case .etbOtpVerify(applicationId: let applicationId, otp: let otp):
            return OneAppAuth.etbOtpVerify(applicationId: applicationId, otp: otp)
        case .etbSetAuth(loginId: let loginId, mPin: let mPin, authType: let authType, isTouchIDEnabled: let isTouchIDEnabled, isFaceIDEnabled: let isFaceIDEnabled, fcmToken: let fcmToken):
            return OneAppAuth.etbSetAuth(loginId: loginId, mPin: mPin, authType: authType, isTouchIDEnabled: isTouchIDEnabled, isFaceIDEnabled: isFaceIDEnabled, fcmToken: fcmToken)
        case .etbResendOTP(etbApplicationId: let etbApplicationId, mobileNumber: let mobileNumber):
            return OneAppAuth.etbResendOTP(etbApplicationId: etbApplicationId, mobileNumber: mobileNumber)
        case .accountSelection(accountNumber: let accountNumber, mcc: let mcc, annualTurnOver: let annualTurnOver, lgCode: let lgCode, lcCode: let lcCode, applicationId: let applicationId, emailId: let emailId, vpa: let vpa, address1: let address1, address2: let address2, address3: let address3, landmark: let landmark, addressType: let addressType, pinCode: let pinCode, city: let city, state: let state, gstn: let gstn, shopName: let shopName):
            return OneAppAuth.accountSelection(accountNumber: accountNumber, mcc: mcc, annualTurnOver: annualTurnOver, lgCode: lgCode, lcCode: lcCode, applicationId: applicationId, emailId: emailId, vpa: vpa, address1: address1, address2: address2, address3: address3, landmark: landmark, addressType: addressType, pinCode: pinCode, city: city, state: state, gstn: gstn, shopName: shopName)
        case .gstncheck(gstnNumber: let gstnNumber, applicationId: let applicationId):
            return OneAppAuth.gstncheck(gstnNumber: gstnNumber, applicationId: applicationId)
        case .etbTermsAndCondition(module: let module):
            return OneAppAuth.etbTermsAndCondition(module: module)
        case .capturemerchantconsent(agreementTime: let agreementTime, isagree: let isagree, loginId: let loginId, metadata: let metadata, module: let module):
            return OneAppAuth.capturemerchantconsent(agreementTime: agreementTime, isagree: isagree, loginId: loginId, metadata: metadata, module: module)
        case .appliactionList(mobileNumber: let mobileNumber):
            return OneAppAuth.appliactionList(mobileNumber: mobileNumber)
        case .eligibilityCheck(mobileNumber: let mobileNumber, applicationId: let applicationId):
            return OneAppAuth.eligibilityCheck(mobileNumber: mobileNumber, applicationId: applicationId)
        case .upiCheck(vpa: let vpa, terminalId: let terminalId):
            return OneAppAuth.upiCheck(vpa: vpa, terminalId: terminalId)
        case .campaignList(tidList: let tidList, campaignId: let campaignId):
            return OneAppAuth.campaignList(tidList: tidList, campaignId: campaignId)
        case .apnTxnDetail(txnid: let txnid):
            return OneAppAuth.apnTxnDetail(txnid: txnid)
        case .etbPanDetails(mobileNumber: let mobileNumber, identifierName: let identifierName, identifierValue: let identifierValue, pepFlag: let pepFlag, lgCode: let lgCode, lcCode: let lcCode):
            return OneAppAuth.etbPanDetails(mobileNumber: mobileNumber, identifierName: identifierName, identifierValue: identifierValue, pepFlag: pepFlag, lgCode: lgCode, lcCode: lcCode)
        case .logout:
            return OneAppAuth.logout
        case .checkHistory(tidList: let tidList, startDate: let startDate, endDate: let endDate):
            return OneAppAuth.checkHistory(tidList: tidList, startDate: startDate, endDate: endDate)
        case .checkElegibleTid(terminals: let terminals):
            return OneAppAuth.checkElegibleTid(terminals: terminals)
        case .switchTids(valueList: let valueList):
            return OneAppAuth.switchTids(valueList: valueList)
        case .campaignEventList:
            return OneAppAuth.campaignEventList
        case .campaignTxnCountList(tidList: let tidList):
            return OneAppAuth.campaignTxnCountList(tidList: tidList)
        case .getCampaignResult(campaignId: let campaignId):
            return OneAppAuth.getCampaignResult(campaignId: campaignId)
        case .plFunnelDetail(tidList: let tidList, since: let since):
            return OneAppAuth.plFunnelDetail(tidList: tidList, since: since)
        case .panAccountDetails(loginId: let loginId, lastSixDigitAccountNo: let lastSixDigitAccountNo):
            return OneAppAuth.panAccountDetails(loginId: loginId, lastSixDigitAccountNo: lastSixDigitAccountNo)
        case .getSettlementReport(tidList: let tidList, startDate: let startDate, endDate: let endDate, sendEmail: let sendEmail):
            return OneAppAuth.getSettlementReport(tidList: tidList, startDate: startDate, endDate: endDate, sendEmail: sendEmail)
            //        case .generateSettlementReport(tidList: let tidList, startDate: let startDate, endDate: let endDate, sendEmail: let sendEmail, startHour: let startHour, endHour: let endHour):
            //            return OneAppAuth.generateSettlementReport(tidList: tidList, startDate: startDate, endDate: endDate, sendEmail: sendEmail, startHour: startHour, endHour: endHour)
        case .macSaveCampaignDetails(id: let id,campaignType: let campaignType, campaignStatus: let campaignStatus, heading: let heading, subHeading: let subHeading, campaignName: let campaignName, description: let description, otherDetails: let otherDetails, campaignFormat: let campaignFormat, caption: let caption, campaignTemplateType: let campaignTemplateType, scheduledDate: let scheduledDate, campaignMetaDetails: let campaignMetaDetails, backgroundImage: let backgroundImage, foregroundImage: let foregroundImage):
            return OneAppAuth.macSaveCampaignDetails(id: id,campaignType: campaignType, campaignStatus: campaignStatus, heading: heading, subHeading: subHeading, campaignName: campaignName, description: description, otherDetails: otherDetails, campaignFormat: campaignFormat, caption: caption, campaignTemplateType: campaignTemplateType, scheduledDate: scheduledDate, campaignMetaDetails: campaignMetaDetails, backgroundImage: backgroundImage, foregroundImage: foregroundImage)
            
        case .macGetCampaignInfo(campaignType: let campaignType, campaignTemplateType: let campaignTemplateType,status: let status,search : let search,pageNo: let pageNo,pageSize: let pageSize):
            
            return OneAppAuth.macGetCampaignInfo(campaignType: campaignType, campaignTemplateType: campaignTemplateType,status: status,search: search,pageNo: pageNo,pageSize: pageSize)
            
        case .macGetImages(fileType: let fileType, terminalId: let terminalId):
            
            return OneAppAuth.macGetImages(fileType: fileType, terminalId: terminalId)
        case .macUploadBase64Image(imageFileData: let imageFileData, fileType: let fileType, fileName: let fileName):
            return OneAppAuth.macUploadBase64Image(imageFileData: imageFileData, fileType: fileType, fileName: fileName)
        case .macTermsAndConditions(module: let module):
            return OneAppAuth.macTermsAndConditions(module: module)
        case .macCaptureMerchantConsent(isagree: let iAgree, agreementTime: let agreementTime, metadata: let metaData, module: let module, tids: let tids):
            return OneAppAuth.macCaptureMerchantConsent(isagree: iAgree, agreementTime: agreementTime, metadata: metaData, module: module, tids: tids)
        case .macCountByStatus:
            return OneAppAuth.macCountByStatus
        case .loanCategoryDetails:
            return OneAppAuth.loanCategoryDetails
        case .oarCreateOffer(id: let id,offerConfiguration: let offerConfiguration, banner: let banner, terminalId: let terminalId, offerName: let offerName, offerDescription: let offerDescription, offerStartDate: let offerStartDate, offerEndDate: let offerEndDate,offerStatus: let offerStatus):
            return OneAppAuth.oarCreateOffer(id: id, offerConfiguration: offerConfiguration, banner: banner, terminalId: terminalId, offerName: offerName, offerDescription: offerDescription, offerStartDate: offerStartDate, offerEndDate: offerEndDate, offerStatus: offerStatus)
            
        case .oarGetBannerTemplate:
            return OneAppAuth.oarGetBannerTemplate
        case .oarGetBannerImages(fileType: let fileType, terminalId: let terminalId):
            return OneAppAuth.oarGetBannerImages(fileType: fileType, terminalId: terminalId)
            
        case .oarDashboardInfo(lowerTimeLimit: let lowerTimeLimit, upperTimeLimit: let upperTimeLimit):
            return OneAppAuth.oarDashboardInfo(lowerTimeLimit: lowerTimeLimit, upperTimeLimit: upperTimeLimit)
        case .oarGetAggregationData(fromDate: let fromDate, toDate: let toDate):
            return OneAppAuth.oarGetAggregationData(fromDate: fromDate, toDate: toDate)
        case .oarUploadBase64Image(imageFileData: let imageFileData, fileType: let fileType, fileName: let fileName):
            return OneAppAuth.oarUploadBase64Image(imageFileData: imageFileData, fileType: fileType, fileName: fileName)
        case .oarSaveBannerDetails(bannerType: let bannerType, bannerMetaDetails: let bannerMetaDetails, bannerFrame: let bannerFrame, bannerImage: let bannerImage):
            return OneAppAuth.oarSaveBannerDetails(bannerType: bannerType, bannerMetaDetails: bannerMetaDetails, bannerFrame: bannerFrame, bannerImage: bannerImage)
        case .oarGetAggregationOfferIdData(fromDate: let fromDate, toDate: let toDate, offerId: let offerId):
            return OneAppAuth.oarGetAggregationOfferIdData(fromDate: fromDate, toDate: toDate, offerId: offerId)
        case .oarGetOfferByTimePeriod(lowerTime: let lowerTime, upperTime: let upperTime):
            return OneAppAuth.oarGetOfferByTimePeriod(lowerTime: lowerTime, upperTime: upperTime)
        case .oarTermsAndConditions(module: let module):
            return OneAppAuth.oarTermsAndConditions(module: module)
        case .oarCaptureMerchantConsent(isagree: let iAgree, agreementTime: let agreementTime, metadata: let metaData, module: let module, tids: let tids):
            return OneAppAuth.oarCaptureMerchantConsent(isagree: iAgree, agreementTime: agreementTime, metadata: metaData, module: module, tids: tids)
        case .oarCheckEligibility(terminalId: let terminalId, allTerminalId: let allTerminalId, rewardCriteria: let rewardCriteria, qualifyingPeriod: let qualifyingPeriod):
            return OneAppAuth.oarCheckEligibility(terminalId: terminalId, allTerminalId: allTerminalId, rewardCriteria: rewardCriteria, qualifyingPeriod: qualifyingPeriod)
        case .oarGetAllOfferResult(sortBy: let sortBy, offerStatus: let offerStatus, pageNo: let pageNo, pageSize: let pageSize, lowerDate: let lowerDate, upperDate: let upperDate, rewardType: let rewardType, paymentModes: let paymentModes, terminalIds: let terminalIds, searchQuery: let searchQuery):
            return OneAppAuth.oarGetAllOfferResult(sortBy: sortBy, offerStatus: offerStatus, pageNo: pageNo, pageSize: pageSize, lowerDate: lowerDate, upperDate: upperDate, rewardType: rewardType, paymentModes: paymentModes, terminalIds: terminalIds, searchQuery: searchQuery)
        case .oarGetRedemptionsForTerminals(offerId: let offerId, terminalId: let terminalId):
            return OneAppAuth.oarGetRedemptionsForTerminals(offerId: offerId, terminalId: terminalId)
        case .oarGetOfferById(offerId: let offerId):
            return OneAppAuth.oarGetOfferById(offerId: offerId)
        case .getOfferCountByStatus(offerStatus: let offerStatus):
            return OneAppAuth.getOfferCountByStatus(offerStatus: offerStatus)
        case .oarPaymentDashboardBannerInfo(terminalIds: let terminalIds):
            return OneAppAuth.oarPaymentDashboardBannerInfo(terminalIds: terminalIds)
        case .oarCustomOfferBannerInfo(mobile: let mobile, tID: let tID, amount: let amount, mode: let mode):
            return OneAppAuth.oarCustomOfferBannerInfo(mobile: mobile, tID: tID, amount: amount, mode: mode)
        case .oarCustomOfferBannerInfoV1(mobile: let mobile, tID: let tID, amount: let amount):
            return OneAppAuth.oarCustomOfferBannerInfoV1(mobile: mobile, tID: tID, amount: amount)
        case .etbValidateQR(upi: let upi):
            return OneAppAuth.etbValidateQR(upi: upi)
        case .oarAddOfferRedeem(offerId: let offerId, terminalId: let terminalId, customerId: let customerId, offerAmount: let offerAmount, transactionAmount: let trasactionAmount, transactionStatus: let transactionStatus, paymentMode: let paymentMode):
            return OneAppAuth.oarAddOfferRedeem(offerId: offerId, terminalId: terminalId, customerId: customerId, offerAmount: offerAmount, transactionAmount: trasactionAmount, transactionStatus: transactionStatus, paymentMode: paymentMode)
            
        case .oarOfferRedemptionData(redemptionId: let redemptionId):
            return OneAppAuth.oarOfferRedemptionData(redemptionId: redemptionId)
        case .v2pTermsAndCondition(module: let module):
            return OneAppAuth.v2pTermsAndCondition(module: module)
        case .v2pCaptureMerchantConsent(isagree: let isagree, agreementTime: let agreementTime, metadata: let metadata, module: let module, tids: let tids):
            return OneAppAuth.v2pCaptureMerchantConsent(isagree: isagree, agreementTime: agreementTime, metadata: metadata, module: module, tids: tids)
        case .vendorPayDetails(terminalId: let terminalId):
            return OneAppAuth.vendorPayDetails(terminalId: terminalId)
        case .qrDetailsList:
            return OneAppAuth.qrDetailsList
        case .activateQR(tid: let tid, vpa: let vpa, rmCode: let rmCode):
            return OneAppAuth.activateQR(tid: tid, vpa: vpa, rmCode: rmCode)
            
        case .generateTransactionReport(tidList: let tidList, startDate: let startDate, endDate: let endDate, sendEmail: let sendEmail):
            return OneAppAuth.generateTransactionReport(tidList: tidList, startDate: startDate, endDate: endDate, sendEmail: sendEmail)
        case .generateSettlementReport(tidList: let tidList, startDate: let startDate, endDate: let endDate, sendEmail: let sendEmail):
            return OneAppAuth.generateSettlementReport(tidList: tidList, startDate: startDate, endDate: endDate, sendEmail: sendEmail)
        case .generateCustomTransactionReport(tidList: let tidList, startDate: let startDate, endDate: let endDate, startHour: let startHour, endHour: let endHour, paymentType: let paymentType, transactionStates: let transactionStates, sendEmail: let sendEmail):
            return OneAppAuth.generateCustomTransactionReport(tidList: tidList, startDate: startDate, endDate: endDate, startHour: startHour, endHour: endHour, paymentType: paymentType, transactionStates: transactionStates, sendEmail: sendEmail)
        case .generateCustomSettlementReport(tidList: let tidList, startDate: let startDate, endDate: let endDate, startHour: let startHour, endHour: let endHour, paymentType: let paymentType, transactionStates: let transactionStates, sendEmail: let sendEmail):
            return OneAppAuth.generateCustomSettlementReport(tidList: tidList, startDate: startDate, endDate: endDate, startHour: startHour, endHour: endHour, paymentType: paymentType, transactionStates: transactionStates, sendEmail: sendEmail)
            
        case .bankProductHistory(terminalIds: let terminalIds, endDate: let endDate, startDate: let startDate, productName: let productName):
            return OneAppAuth.bankProductHistory(terminalIds: terminalIds, endDate: endDate, startDate: startDate, productName: productName)
        case .bankProductEligibility(terminalIds: let terminalIds, productName: let productName):
            return OneAppAuth.bankProductEligibility(terminalIds: terminalIds,productName: productName)
        case .emiListProduct :
            return OneAppAuth.emiListProduct
        case .activateDeactivateTids(terminalIds: let terminalIds, productName: let productName, status: let status, reason: let reason):
            return OneAppAuth.activateDeactivateTids(terminalIds: terminalIds, productName: productName, status: status, reason: reason)
        case .getUserTerminalInfo:
            return OneAppAuth.getUserTerminalInfo
        case .getMapper(terminalId: let terminalId):
            return OneAppAuth.getMapper(terminalId: terminalId)
        case .emiVerifyOtp(productName: let productName, requestId: let requestId, otp: let otp):
            return OneAppAuth.emiVerifyOtp(productName: productName, requestId: requestId, otp: otp)
        case .getSettlementData(terminalIdList: let terminalIdList, startDate: let startDate, endDate: let endDate):
            return OneAppAuth.getSettlementData(terminalIdList: terminalIdList, startDate: startDate, endDate: endDate)
        case .getByMobileNumber(mobileNumber: let mobileNumber):
            return OneAppAuth.getByMobileNumber(mobileNumber: mobileNumber)
        case .addCustomer(mobileNumber: let mobileNumber):
            return OneAppAuth.addCustomer(mobileNumber: mobileNumber)
        case .getActiveMapper(mapperId: let mapperId, cid: let cid):
            return OneAppAuth.getActiveMapper(mapperId: mapperId, cid: cid)
        case .updateMapperData(mapperData: let mapperData):
            return OneAppAuth.updateMapperData(mapperData: mapperData)
        case .preApprovedEMI(customerId: let customerId, terminalId: let terminalId):
            return OneAppAuth.preApprovedEMI(customerId: customerId, terminalId: terminalId)
        case .emiPlans(transactionAmount: let transactionAmount):
            return OneAppAuth.emiPlans(transactionAmount: transactionAmount)
        case .emiInitiateTransaction(customerId: let customerId, terminalId: let terminalId, transactionAmount: let transactionAmount, redemptionIds: let redemptionIds):
            return OneAppAuth.emiInitiateTransaction(customerId: customerId, terminalId: terminalId, transactionAmount: transactionAmount, redemptionIds: redemptionIds)
        case .emiCheckEligibility(brandName: let brandName ,emi: let emi,emiTransactionId: let emiTransactionId,interestAmount: let interestAmount,interestRate:let interestRate,paymentCredential: let paymentCredential,paymentCredentialType:let paymentCredentialType,processingFee: let processingFee,productType: let productType,tenure: let tenure,tenureType: let tenureType,transactionAmount: let transactionAmount,insuranceCharges: let insuranceCharges,otherCharges: let otherCharges,paymentFrequency: let paymentFrequency,noOfInstallment:let noOfInstallment,customerConsent:let customerConsent,customerConsentTime: let customerConsentTime):
            return OneAppAuth.emiCheckEligibility(brandName: brandName, emi: emi, emiTransactionId: emiTransactionId, interestAmount: interestAmount, interestRate: interestRate, paymentCredential: paymentCredential, paymentCredentialType: paymentCredentialType, processingFee: processingFee, productType: productType, tenure: tenure, tenureType: tenureType, transactionAmount: transactionAmount,insuranceCharges: insuranceCharges,otherCharges: otherCharges,paymentFrequency: paymentFrequency,noOfInstallment: noOfInstallment,customerConsent: customerConsent,customerConsentTime: customerConsentTime)
            
        case .emiPaymentVerifyOtp(emiTransactionId: let emiTransactionId,otp: let otp):
            return OneAppAuth.emiPaymentVerifyOtp(emiTransactionId: emiTransactionId, otp: otp)
        case .emiGenerateCustomerUrl(customerId: let customerId,terminalId: let terminalId,transactionAmount: let transactionAmount):
            return OneAppAuth.emiGenerateCustomerUrl(customerId: customerId, terminalId: terminalId, transactionAmount: transactionAmount)
        case .bankEMIResendOTP(requestId: let requestId):
            return OneAppAuth.bankEMIResendOTP(requestId: requestId)
            
        case .getMidSegments:
            return OneAppAuth.getMidSegments
        case .qrDetailsWaiting(terminalId: let terminalId):
            return OneAppAuth.qrDetailsWaiting(terminalId: terminalId)
        case .activationRequest(terminalIds: let terminalIds, productType: let productType, requestedBy: let requestedBy):
            return OneAppAuth.activationRequest(terminalIds: terminalIds, productType: productType, requestedBy: requestedBy)
        case .checkAus(cidIds: let cidIds):
            return OneAppAuth.checkAus(cidIds: cidIds)
        case .reportingResults(reportName: let reportName, request: let request, fileType: let fileType, sendEmail: let sendEmail):
            return OneAppAuth.reportingResults(reportName: reportName, request: request, fileType: fileType, sendEmail: sendEmail)
        case .reportingResultsMultiple(reportList: let reportList, fileType: let fileType, sendEmail: let sendEmail, rConfig : let rConfig):
            return OneAppAuth.reportingResultsMultiple(reportList: reportList, fileType: fileType, sendEmail: sendEmail, rConfig: rConfig)
        case .checkFileStatus(requestId: let requestId):
            return OneAppAuth.checkFileStatus(requestId: requestId)
        case .sendEmail(requestId: let requestId):
            return OneAppAuth.sendEmail(requestId: requestId)
            
        case .getPreferencesSMSNotificationList(terminalList: let terminalList):
            return OneAppAuth.getPreferencesSMSNotificationList(terminalList: terminalList)
        case .getPreferencesSMSNotificationHistory(pageNo: let pageNo, pageSize: let pageSize, terminalList: let terminalList):
            return OneAppAuth.getPreferencesSMSNotificationHistory(pageNo: pageNo, pageSize: pageSize, terminalList: terminalList)
        case .getPreferencesSMSNotificationUpdateList(terminalList: let terminalList):
            return OneAppAuth.getPreferencesSMSNotificationUpdateList(terminalList: terminalList)
        case .onboardVyaparify(terminalId : let terminalId):
            return OneAppAuth.onboardVyaparify(terminalId: terminalId)
        case .getRedirectionDetails(terminalId : let terminalId):
            return OneAppAuth.getRedirectionDetails(terminalId: terminalId)
        case .getPosHistory(terminalIds: let terminalIds):
            return OneAppAuth.getPosHistory(terminalIds: terminalIds)
        case .getPosToken(terminalIds: let terminalIds):
            return OneAppAuth.getPosToken(terminalIds: terminalIds)
        case .getPosDeviceDetails(terminalId: let terminalId):
            return OneAppAuth.getPosDeviceDetails(terminalId: terminalId)
        case .getPosDefaultMdrRate(terminalId: let terminalId):
            return OneAppAuth.getPosDefaultMdrRate(terminalId: terminalId)
        case .posEmail(applicationId: let applicationId):
            return OneAppAuth.posEmail(applicationId: applicationId)
        case .posDownload(applicationId: let applicationId):
            return OneAppAuth.posDownload(applicationId: applicationId)
        case .linkedDevices(members: let members, memberType: let memberType):
            return OneAppAuth.linkedDevices(members: members, memberType: memberType)
        case .requestOTP(imei: let imei, members: let members, memberType: let memberType):
            return OneAppAuth.requestOTP(imei: imei, members: members, memberType: memberType)
        case .registerDevice(imei: let imei, deviceID: let deviceID, otp: let otp, clientType: let clientType, action: let action,members:let members,memberType:let memberType):
            return OneAppAuth.registerDevice(imei: imei, deviceID: deviceID, otp: otp, clientType: clientType, action: action,members:members,memberType:memberType)
        case .deviceSetting(language: let language, imei: let imei, deviceID: let deviceID):
            return OneAppAuth.deviceSetting(language: language, imei: imei, deviceID: deviceID)
        case .actions(imei: let imei, action: let action):
            return OneAppAuth.actions(imei: imei, action: action)
        case .deviceLang:
            return OneAppAuth.deviceLang
        case .tidDetails(terminalId: let terminalId):
            return OneAppAuth.tidDetails(terminalId: terminalId)
        case .diagnostics(terminalId: let terminalId):
            return OneAppAuth.diagnostics(terminalId: terminalId)
        case .ampGenerateToken:
            return OneAppAuth.ampGenerateToken
        case .v2TnCContent(module: let module):
            return OneAppAuth.v2TnCContent(module: module)
        case .getConsent(module: let module, loginId: let loginId):
            return OneAppAuth.getConsent(module: module, loginId: loginId)
        case .soundboxStatus(terminalIds: let terminalIds):
            return OneAppAuth.soundboxStatus(terminalIds: terminalIds)
        case .getTemplates:
            return OneAppAuth.getTemplates
        case .createTicket(terminalId: let terminalId, templateId: let templateId, ticketValues: let ticketValues):
            return OneAppAuth.createTicket(terminalId: terminalId, templateId: templateId, ticketValues: ticketValues)
        case .getDashboardData(terminals: let terminals):
            return OneAppAuth.getDashboardData(terminals: terminals)
        case .getDeviceType(terminals: let terminals):
            return OneAppAuth.getDeviceType(terminals: terminals)
        case .panToGst(terminalId: let terminalId):
            return OneAppAuth.panToGst(terminalId: terminalId)
        case .sendOtpService(contextName: let contextName, contextId: let contextId, purpose: let purpose, communicationType: let communicationType, communicationValue: let communicationValue):
            return OneAppAuth.sendOtpService(contextName: contextName, contextId: contextId, purpose: purpose, communicationType: communicationType, communicationValue: communicationValue)
        case .resendServiceOTP(requestId: let requestId):
            return OneAppAuth.resendServiceOTP(requestId: requestId)
        case .verifyServiceOTP(requestId: let requestId, otp: let otp):
            return OneAppAuth.verifyServiceOTP(requestId: requestId, otp: otp)
        case .addTidReportEmail(tid: let tid, reportEmail: let reportEmail, userMobile: let userMobile):
            return OneAppAuth.addTidReportEmail(tid: tid, reportEmail: reportEmail, userMobile: userMobile)
        case .getReportEmail(tids: let tids,userMobile: let userMobile):
            return OneAppAuth.getReportEmail(tids: tids,userMobile: userMobile)
        case .editReportEmail(tid: let tid, reportEmail: let reportEmail, userMobile: let userMobile):
            return OneAppAuth.editReportEmail(tid: tid, reportEmail: reportEmail, userMobile: userMobile)
            
        case .insuranceCyberProduct(terminalId: let terminalId):
            return OneAppAuth.insuranceCyberProduct(terminalId: terminalId)
        case .cyberKnowMorw(applicationId: let applicationId):
            return OneAppAuth.cyberKnowMorw(applicationId: applicationId)
        case .insuranceSendOtp(contextName: let contextName, contextId: let contextId, purpose: let purpose, communicationType: let communicationType, communicationValue: let communicationValue, otherDetails: let otherDetails, otpChannel: let otpChannel):
            return OneAppAuth.insuranceSendOtp(contextName: contextName, contextId: contextId, purpose: purpose, communicationType: communicationType, communicationValue: communicationValue, otherDetails: otherDetails, otpChannel: otpChannel)
        case .insuranceResendOtp(requestId: let requestId, otpChannel: let otpChannel):
            return OneAppAuth.insuranceResendOtp(requestId: requestId, otpChannel: otpChannel)
        case .insuranceVerifyOtp(requestId: let requestId, otp: let otp):
            return OneAppAuth.insuranceVerifyOtp(requestId: requestId, otp: otp)
        case .insurancePurchase(applicationId: let applicationId):
            return OneAppAuth.insurancePurchase(applicationId: applicationId)
        case .insuranceDetails(terminalId: let terminalId):
            return OneAppAuth.insuranceDetails(terminalId: terminalId)
        case .fetchPanToGstin(applicationId: let applicationId, state: let state, pincode: let pincode, accountNumber: let accountNumber):
            return OneAppAuth.fetchPanToGstin(applicationId: applicationId, state: state, pincode: pincode, accountNumber: accountNumber)
        case .getSettlementSummaryData(terminalIdList: let terminalIdList, startDate: let startDate, endDate: let endDate, dateType: let dateType):
            return OneAppAuth.getSettlementSummaryData(terminalIdList: terminalIdList, startDate: startDate, endDate: endDate, dateType: dateType)
            
        case .handleCardTxnData(amount: let amount, terminalId: let terminalId, description: let description, customerMobile: let customerMobile, providerId: let providerId, status: let status, approvalCode: let approvalCode, retrievalReferenceNumber: let retrievalReferenceNumber, transactionId: let transactionId):
            return OneAppAuth.handleCardTxnData(amount: amount, terminalId: terminalId, description: description, customerMobile: customerMobile, providerId: providerId, status: status, approvalCode: approvalCode, retrievalReferenceNumber: retrievalReferenceNumber, transactionId: transactionId)
        case .getSettlementDetails(terminalIds: let terminalIds, startDate: let startDate, endDate: let endDate, reqType: let reqType, dateType: let dateType):
            return OneAppAuth.getSettlementDetails(terminalIds: terminalIds, startDate: startDate, endDate: endDate, reqType: reqType, dateType: dateType)
        case .getSettlementList(reqType: let reqType, transactions: let transactions):
            return OneAppAuth.getSettlementList(reqType: reqType, transactions: transactions)
        case .getSettlementListSummary(terminalIdList: let terminalIdList, dateType: let dateType, startDate: let startDate, endDate: let endDate):
            return OneAppAuth.getSettlementListSummary(terminalIdList: terminalIdList, dateType: dateType, startDate: startDate, endDate: endDate)
        case .getTransactionSummaryData(txnid: let txnid):
            return OneAppAuth.getTransactionSummaryData(txnid: txnid)
        case .validateCardTxnSession:
            return OneAppAuth.validateCardTxnSession
        case .deactivatedReason(terminalIds: let terminalIds):
            return OneAppAuth.deactivatedReason(terminalIds: terminalIds)
        case .memberAttributeFetch(memberType: let memberType, memberValues: let memberValues):
            return OneAppAuth.memberAttributeFetch(memberType: memberType, memberValues: memberValues)
        }
    }
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
}
import Network
let monitor = NWPathMonitor()

func checkInterwebs() -> Bool {
    var status = false
    monitor.pathUpdateHandler = { path in
        if path.status == .satisfied {
            status = true  // online
        }
    }
    return status
}
func isConnectionAvailable() -> Bool {
    let reachability = try! Reachability()
    
    let networkStatus = reachability.connection
    
    return !(networkStatus == .unavailable)
}
