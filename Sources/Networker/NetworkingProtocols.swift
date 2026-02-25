//
//  NetworkingProtocols.swift
//  NetWorker
//

import Foundation

public enum EncryptionType {
    case AES
    case RSA_AES
}

public protocol AppAuth {
    var encryptionType: EncryptionType { get }
    var isRequestEncrypted: Bool { get }
    var baseURL: URL { get }
    var path: String { get }
    var fullURL: URL { get }
    var method: String { get }
    var sampleData: Data { get }
    var params: [String : Any] { get }
    var params1: [ Any ] { get }
    var headers: [String : String]? { get }
}
