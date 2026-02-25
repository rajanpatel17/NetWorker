//
//  CryptoHelper.swift
//  NetWorker
//

import Foundation
import Security
import CryptoSwift

func randomString(length: Int) -> String {
	let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
	return String((0..<length).map{ _ in letters.randomElement()! })
}
protocol CryptoHelper {
    static func getPayload(forParams params: [String : Any], aesKey: String, aesIV: String) -> [String : Any]
    static func getPayload1(forParams params: [Any], aesKey: String, aesIV: String) -> [String : Any]
    static func decrypt(payload: Data, aesKey: String, aesIV: String) -> Data
}

internal class RSA_AES_CryptoHelper: CryptoHelper {
	static var rsaPublicKey: String = ""
	
    class func getPayload1(forParams params: [Any], aesKey: String, aesIV: String) -> [String : Any] {
        
        print("To encrypt - \(params)")
        print("Key - \(aesKey)")
        print("IV - \(aesIV)")
        
        let jsonData = try! JSONSerialization.data(withJSONObject: params, options: [])
        let jsonString = String(data: jsonData, encoding: .utf8) ?? ""
        
        var payload = ""
        
        do {
            
            let gcm = GCM(iv: aesIV.bytes, mode: .combined)
            let aes = try AES(key: aesKey.bytes, blockMode: gcm, padding: .noPadding)
            let encrypted = try aes.encrypt(jsonString.bytes)
            
            let data = Data(bytes: encrypted, count: encrypted.count)
            
//            let decryptedData = decrypt(payload: data, aesKey: aesKey, aesIV: aesIV)
//            let decryptedString = String(data: decryptedData, encoding: .utf8)
            
            payload = data.base64EncodedString()
            
        } catch {
            print(error)
        }
        
        do {
            let rsaKey = try PublicKey(base64Encoded: rsaPublicKey)
            let aesClearMessage = try ClearMessage(string: aesKey, using: .utf8)
//            let rsaEncryptedKey = try aesClearMessage.encrypted(with: rsaKey, padding: .OAEP)
        } catch {
            print(error)
        }
        guard let rsaKey = try? PublicKey(base64Encoded: rsaPublicKey),
            let aesClearMessage = try? ClearMessage(string: aesKey, using: .utf8),
            let rsaEncryptedKey = try? aesClearMessage.encrypted(with: rsaKey, padding: .OAEP) else {
                return [:]
        }
        
        print("Encrypted - \(payload)")
        
        return ["KEY" : rsaEncryptedKey.data.base64EncodedString(),
                "IV" : aesIV.data(using: .utf8)?.base64EncodedString() ?? "",
                "PAYLOAD" : payload]
    }
    
	class func getPayload(forParams params: [String : Any], aesKey: String, aesIV: String) -> [String : Any] {
		
		print("To encrypt - \(params)")
		print("Key - \(aesKey)")
		print("IV - \(aesIV)")
		
		let jsonData = try! JSONSerialization.data(withJSONObject: params, options: [])
		let jsonString = String(data: jsonData, encoding: .utf8) ?? ""
		
		var payload = ""
		
		do {
			
			let gcm = GCM(iv: aesIV.bytes, mode: .combined)
			let aes = try AES(key: aesKey.bytes, blockMode: gcm, padding: .noPadding)
			let encrypted = try aes.encrypt(jsonString.bytes)
			
			let data = Data(bytes: encrypted, count: encrypted.count)
			
//			let decryptedData = decrypt(payload: data, aesKey: aesKey, aesIV: aesIV)
//			let decryptedString = String(data: decryptedData, encoding: .utf8)
			
			payload = data.base64EncodedString()
			
		} catch {
			print(error)
		}
		
        do {
            let rsaKey = try PublicKey(base64Encoded: rsaPublicKey)
            let aesClearMessage = try ClearMessage(string: aesKey, using: .utf8)
//            let rsaEncryptedKey = try aesClearMessage.encrypted(with: rsaKey, padding: .OAEP)
        } catch {
            print(error)
        }
		guard let rsaKey = try? PublicKey(base64Encoded: rsaPublicKey),
			let aesClearMessage = try? ClearMessage(string: aesKey, using: .utf8),
			let rsaEncryptedKey = try? aesClearMessage.encrypted(with: rsaKey, padding: .OAEP) else {
				return [:]
		}
		
		print("Encrypted - \(payload)")
		
		return ["KEY" : rsaEncryptedKey.data.base64EncodedString(),
				"IV" : aesIV.data(using: .utf8)?.base64EncodedString() ?? "",
				"PAYLOAD" : payload]
	}
	
	
	
	class func decrypt(payload: Data, aesKey: String, aesIV: String) -> Data {
		
		print("To decrypt - \(String(data: payload, encoding: .utf8) ?? "")")
		print("Key - \(aesKey)")
		print("IV - \(aesIV)")
		
		do {
//			let array: [UInt8] = Array(Data(base64Encoded:aesIV)!)
//			let keyArr: [UInt8] = Array(Data(base64Encoded:aesKey)!)
//			let gcm = GCM(iv: array, mode: .combined)
//
//			let aes = try AES(key: keyArr, blockMode: gcm, padding: .iso78164)
//			let decrypted = try aes.decrypt(payload.bytes)
////			let decryptionString = String(bytes: decrypted, encoding: .utf8)
			
			
			let gcm = GCM(iv: aesIV.bytes, mode: .combined)
			let aes = try AES(key: aesKey.bytes, blockMode: gcm, padding: .noPadding)
			let decrypted = try payload.decrypt(cipher: aes)
			let decryptionString = String(data: decrypted, encoding: .utf8) ?? ""
			
			print("Decrypted String - \(decryptionString)")
			
			return decrypted
			
		} catch {
			
			print("decryption Failed Catch Block")
            print(error.localizedDescription)
			print("decryption Failed Catch Block1")
			
		}
		
		return Data()
		
	}
	
	
}



internal class AES_CryptoHelper: CryptoHelper {
    
    class func getPayload1(forParams params: [Any], aesKey: String, aesIV: String) -> [String : Any] {
        
        print("To encrypt - \(params)")
        print("Key - \(aesKey)")
        print("IV - \(aesIV)")
        
        let jsonData = try! JSONSerialization.data(withJSONObject: params, options: [])
        let jsonString = String(data: jsonData, encoding: .utf8) ?? ""
        
        var payload = ""
        
        do {
            
            let gcm = GCM(iv: aesIV.bytes, mode: .combined)
            let aes = try AES(key: aesKey.bytes, blockMode: gcm, padding: .noPadding)
            let encrypted = try aes.encrypt(jsonString.bytes)
            
            let data = Data(bytes: encrypted, count: encrypted.count)
            
//            let decryptedData = decrypt(payload: data, aesKey: aesKey, aesIV: aesIV)
//            let decryptedString = String(data: decryptedData, encoding: .utf8)
            
            payload = data.base64EncodedString()
            
        } catch {
            print(error)
        }
        
        
//        guard  let aesClearMessage = try? ClearMessage(string: aesKey, using: .utf8) else {
//                return [:]
//        }
        
        print("Encrypted - \(payload)")
        
        return ["AgentId" : BaseUrl.shared.AES_CryptoHelperAgentId,
                "ClientSecretKey" : BaseUrl.shared.AES_CryptoHelperClientSecretKey,
                "Payload" : payload]
    }
    
    class func getPayload(forParams params: [String : Any], aesKey: String, aesIV: String) -> [String : Any] {
        
        print("To encrypt - \(params)")
        print("Key - \(aesKey)")
        print("IV - \(aesIV)")
        
        let jsonData = try! JSONSerialization.data(withJSONObject: params, options: [])
        let jsonString = String(data: jsonData, encoding: .utf8) ?? ""
        
        var payload = ""
        
        do {
            /*
            let gcm = GCM(iv: aesIV.bytes, mode: .combined)
            let aes = try AES(key: aesKey.bytes, blockMode: gcm, padding: .noPadding)
            let encrypted = try aes.encrypt(jsonString.bytes)
            
            let data = Data(bytes: encrypted, count: encrypted.count)
            
//            let decryptedData = decrypt(payload: data, aesKey: aesKey, aesIV: aesIV)
//            let decryptedString = String(data: decryptedData, encoding: .utf8)
            
            payload = data.base64EncodedString()
            */
            

            let aes = try AES(key: aesKey.bytes, blockMode: ECB())
            let encrypted = try aes.encrypt(jsonString.bytes)
            let encryptedBase64 = encrypted.toBase64()
            payload = encryptedBase64 ?? ""
        } catch {
            print(error)
        }
        
        
//        guard  let aesClearMessage = try? ClearMessage(string: aesKey, using: .utf8) else {
//                return [:]
//        }
        
        print("Encrypted - \(payload)")
        
        return ["AgentId" : BaseUrl.shared.AES_CryptoHelperAgentId,
                "ClientSecretKey" : BaseUrl.shared.AES_CryptoHelperClientSecretKey,
                "Payload" : payload]
//        return ["AgentId" : "2speQPhzE5oIVaKuZF7DBglw3SmqrYCv",
//                "ClientSecretKey" : "yE6wIKiNZQpxG9UkuLMTevz43s71Wqj5",
//                "Payload" : payload]//UAT
//        return ["AgentId" : "9ced8284571180bb4ff1a5f7ac59fcac",
//                "ClientSecretKey" : "62e79e9b790acff763b899ed3fa1af5a",
//                "Payload" : payload]//Prod
    }
    
    
    
    class func decrypt(payload: Data, aesKey: String, aesIV: String) -> Data {
        
        return Data()
    }
    
    
}
