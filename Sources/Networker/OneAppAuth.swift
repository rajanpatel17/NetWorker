//
//  OneAppAuth.swift
//  NetWorker
//

import Foundation
import UIKit
import AVFoundation

public enum AuthCustome {
    case getKey
    case authMPos(terminalID: String)
    case validateUser(loginID: String, appVersion: String, devicePlatform: String)
    case verifyOTP(otp: String)
    case resendOTP
    case logout
    case verifyPin(loginId: String, authType: String, mPIN: String, fcmToken: String, simID: String, appInstanceId: String)
    case forgotPin(loginId: String)
    case setAuth(authType: String, mPin: String, isFaceEnabled: Bool, isTouchEnabled: Bool)
    case addUser(userMobile: String, userName: String, userEmailID: String)
    case modifyUser(userMobile: String, userName: String, userEmailID: String, accountStatus: Int)
    case addUserRole(userMobile: String, tidList: [(tid: String, role: String)])
    case modifyUserRole(userMobile: String, tidList: [(tid: String, role: String, userState: String)])
    case getAPKUrl(appVersion: String)
    case getUserProfile(loginID: String)
    case getUserProfileV2(loginID: String)

    case getUserRole
    case getUserTerminalList(tids: [String], mids: [String], cids: [String], cities: [String], locations: [String])
    case paymentSalesCardHDFC(terminalID: [String], salesCount: String, startDate: String, endDate: String)
    case paymentSalesCardMintoak(terminalID: [String], salesCount: String, startDate: String, endDate: String)
    case payementModeAndLoyaltyAPI(terminalID: String, salesCount: String, startDate: String, endDate: String)
    case cashPay(terminalId: String, amount: String, description: String, appTxnid: String, plCustId: String, customerMobileNumber: String, redemptionId: String)
    case QRPay(terminalId: String, amount: String, description: String, customerMobileNumber: String, appTxnid: String, pgId: String, plCustId: String, redemptionId: String)
    case LinkPay(terminalId: String, amount: String, description: String, customerMobileNumber: String, appTxnid: String, pgId: String, plCustId: String, redemptionId: String)
    case UPICollect(terminalId: String, amount: String, description: String, customerMobileNumber: String, payerVpa: String, appTxnid: String, pgId: String, plCustId: String, redemptionId: String)
    case UPILink(terminalId: String, plCustId: String, amount: String, description: String, customerMobileNumber: String, appTxnid: String, pgId: String, medium: String, redemptionId: String)
    case helpDesk
    case getHelpDeskDetails(terminalID: String)
    case checkElegibleTid(terminals: [String])
    case paymentModeGraphViewAll(tidList: [String], startDate: String, endDate: String)
    case performanceViewAllWithDateRange(tidList: [String], startDate: String, endDate: String)
    case performanceViewAllWithServiceType(tidList: [String], serviceType: String)
    case miniStateMent(tidList: [String], type: String, txnType: [String], serviceType: String, count: String, startDate: String, endDate: String)
    case merchantTxnDetail(tidList: [String], type: String, txnType: [String], paymentType: [String]?, startDate: String, endDate: String)
    case getFeedback(tidList: [String], startDate: String, endDate: String)
    case paymentModeSummary(tidList: [String], startDate: String, endDate: String)
    case getFeedbackDetails(tidList: [String], startDate: String, endDate: String)
    case getComments(tidList: [String], startDate: String, endDate: String)
    case checkHistory(tidList: [String], startDate: String, endDate: String)
    case getSettlementData(terminalIdList: [String], startDate: String, endDate: String)
    //PAYLATER DASHBOARD for 360 and MMP
    case getMidSegments
    //@POST("HDFC360/getPayLaterFunnel")
    case getPayLaterFunnel360(tidList: [String], startDate: String, endDate: String)
    
    //@POST("HDFC/getPayLaterFunnel")
    case getPayLaterFunnelMMP(tidList: [String], startDate: String, endDate: String)
    
    //@POST("HDFC360/payLaterViewAll")
    ///type terminal for bizview
    case getPayLaterViewAll(tidList: [String], type: String)
    case switchTids(valueList: [[String:String]])
    //@POST("HDFC360/PLCardsDetail")
    ///type terminal for bizview, since in numeric string
    case getPayLaterCardDetail(tidList: [String], type: String, since: String)
    
    //@POST("HDFC/GetPLTxns")
    case getTxnDetailsMMP(tidList: [String])
    
    //@POST("HDFC360/GetPLTxns")
    case getTxnDetails360(tidList: [String])
    
    //@POST("HDFC/V1/GetPLTxns")
    case getPLFunnelViewAllDetailsMMP(tidList: [String], since: String)
    
    //@POST("HDFC360/getIndividualPlTxns")
    case getIndividualPlTxns(tidList: [String], since: String)
    case plFunnelDetail(tidList: [String], since: String)
    
    //@POST("HDFC360/GetPLCustDetails")
    case getPLCustDetails360(tidList: [String], custId: String)
    
    //@POST("HDFC/V1/GetPLCustDetails")
    case getPLCustDetailsMMP(tidList: [String], custIdGetPLTxns: String)

    case getTransactionReport(tidList: [String], startDate: String, endDate: String, sendEmail: Bool)
    case getSettlementReport(tidList: [String], startDate: String, endDate: String, sendEmail: Bool)
    
    case resendReceipt(mtxnid: String, msisdn: String)
    case mobNumberViewAll(tidList: [String], startDate: String, endDate: String)
    case getStoreRatingData(tidList: [String], startDate: String, endDate: String)
    case getStoreFeedbackComments(tidList: [String], startDate: String, endDate: String)
    case loyalty(mobile: String, terminalId: String)
    case getCustomer(customerMobile: String, tid: String)
    case addPayLaterTxn(customerMobile: String, tid: String, amount: String, address : String, name: String, description:String, pgId:String, isNew: Bool)
    case getBadges(tidList: [String])
    case bannerList
    case mdrCharges
    case businessCategory(location: String)
    case plDayDetail(tidList: [String], startDate: String, endDate: String, type: String)
    case v2pTxnList(phoneNumber: String)
    case loanBlocks
    case loanCategoryDetails
    case loanEligibility(amountID: Int, tenureID:Int)
    case swiftieAuthenticateUser(email: String, phone: String, returnURL: String, serviceType: String, TID: String, pan: String, gstin: String)
    case LeaderBoard(tidList: [String], startDate: String, endDate: String)
    case ProductEnquiry(tid:String, cardNumber:String, customerMsisdn:String, prodType:String, appRefId:String, txnid:String)
    case VeriFyOTP(tid:String, otp:String, customerMsisdn:String, prodType:String, appRefId:String)
    case orderTrackList(tidList: [String])
    case creditToBankCardList(tidList: [String], startDate: String, endDate: String)
    case signUp(loginId: String, deviceId: String, appVersion: String)
    case pinCodeMapper(pinCode: String)
    case etbDOB(mobileNumber: String, dob: String)
    case etbPanDetails(mobileNumber: String, identifierName: String, identifierValue: String, pepFlag: String, lgCode: String, lcCode: String)
    case etbResendOTP(etbApplicationId: String, mobileNumber: String)
    case etbOtpVerify(applicationId: String, otp: String)
    case etbSetAuth(loginId: String, mPin: String, authType: String, isTouchIDEnabled: Bool, isFaceIDEnabled: Bool, fcmToken: String)
    case accountSelection(accountNumber: String, mcc: String, annualTurnOver: String, lgCode: String, lcCode: String, applicationId: String, emailId: String, vpa: String, address1: String, address2: String, address3: String, landmark: String, addressType: String, pinCode: String, city: String, state: String, gstn: String, shopName: String)
    case upiCheck(vpa: String, terminalId: String)
    case etbTermsAndCondition(module: String)
    case etbValidateQR(upi: String)
    case gstncheck(gstnNumber: String, applicationId: String)
    case capturemerchantconsent(agreementTime: String, isagree: Bool, loginId: String, metadata: String, module: String)
    case appliactionList(mobileNumber: String)
    case eligibilityCheck(mobileNumber: String, applicationId: String)
    case campaignList(tidList: [String], campaignId: String)
    case apnTxnDetail(txnid: [String])
    case campaignEventList
    case campaignTxnCountList(tidList: [String])
    case getCampaignResult(campaignId: String)
    case panAccountDetails(loginId: String, lastSixDigitAccountNo: String)
    case macSaveCampaignDetails(id:Int?,campaignType: String?,campaignStatus:String?,heading:String?,subHeading:String?,campaignName:String,description:String?,otherDetails:String?,campaignFormat:String?,caption:String?,campaignTemplateType:String?,scheduledDate:String?,campaignMetaDetails:[String:Any]?,backgroundImage:[String:Int]?,foregroundImage:[String:Int]?)
    case macGetCampaignInfo(campaignType: String?,campaignTemplateType:String?,status:String?,search:String?,pageNo:String?,pageSize:String?)
    case macGetImages(fileType:String,terminalId:String)
    case macUploadBase64Image(imageFileData:String,fileType:String,fileName:String)
    case macTermsAndConditions(module:String)
    case macCaptureMerchantConsent(isagree:Bool,agreementTime:String,metadata:String,module:String,tids:[String])
    case macCountByStatus
//OAR
    case oarCreateOffer(id : Int?,offerConfiguration:[String:Any]?,banner:[String:Int]?,terminalId:[String]?,offerName: String?,offerDescription:String?,offerStartDate:String?,offerEndDate:String?,offerStatus:String?)
    case oarGetBannerTemplate
    case oarGetBannerImages(fileType:String,terminalId:String)
    case oarDashboardInfo(lowerTimeLimit:String,upperTimeLimit:String)
    case oarGetAggregationData(fromDate:String,toDate:String)
    case oarUploadBase64Image(imageFileData:String,fileType:String,fileName:String)
    case oarSaveBannerDetails(bannerType: String?,bannerMetaDetails:[String:Any]?,bannerFrame:[String:Int]?,bannerImage:[String:Int]?)
    case oarGetAggregationOfferIdData(fromDate:String,toDate:String,offerId:[String])
    case oarGetOfferByTimePeriod(lowerTime:String,upperTime:String)
    case oarTermsAndConditions(module:String)
    case oarCaptureMerchantConsent(isagree:Bool,agreementTime:String,metadata:String,module:String,tids:[String])
    case oarCheckEligibility(terminalId:[String]?,allTerminalId:[String]?,rewardCriteria:[[String:Any]]?,qualifyingPeriod:[String:Any]?)
    case oarGetAllOfferResult(sortBy:String,offerStatus:String,pageNo:String,pageSize:String,lowerDate:String,upperDate:String,rewardType:[String],paymentModes:[String],terminalIds:[String],searchQuery:String)
    case oarGetRedemptionsForTerminals(offerId:String,terminalId:[String])
    case oarGetOfferById(offerId:String)
    case getOfferCountByStatus(offerStatus:String)
    case oarPaymentDashboardBannerInfo(terminalIds:[String])
    case oarCustomOfferBannerInfo(mobile: String, tID: String, amount: String, mode: String)
    case oarCustomOfferBannerInfoV1(mobile: String, tID: [String], amount: String)
    case oarAddOfferRedeem(offerId: String, terminalId: String, customerId: String, offerAmount: String, transactionAmount: String, transactionStatus: String, paymentMode: String)
    case oarOfferRedemptionData(redemptionId: String)
    case v2pTermsAndCondition(module: String)
    case v2pCaptureMerchantConsent(isagree: Bool, agreementTime: String, metadata: String, module: String, tids: [String])
    case vendorPayDetails(terminalId: String)
    case activateQR(tid: String, vpa: String, rmCode: String)
    case qrDetailsList
    case qrDetailsWaiting(terminalId: String)
    
    case generateTransactionReport(tidList: [String], startDate: String, endDate: String, sendEmail: Bool)
    case generateSettlementReport(tidList: [String], startDate: String, endDate: String, sendEmail: Bool)
    case generateCustomTransactionReport(tidList: [String], startDate: String, endDate: String, startHour: String, endHour: String, paymentType: [String], transactionStates: [String], sendEmail: Bool)
    case generateCustomSettlementReport(tidList: [String], startDate: String, endDate: String, startHour: String, endHour: String, paymentType: [String], transactionStates: [String], sendEmail: Bool)
    case bankProductHistory(terminalIds:[String],endDate:String,startDate:String,productName:String)
    case bankProductEligibility(terminalIds:[String],productName:String)
    case emiListProduct
    case activateDeactivateTids(terminalIds:[String],productName:String, status:String,reason:String)
    case getUserTerminalInfo
    case getMapper(terminalId: String)
    case emiVerifyOtp(productName:String, requestId:String, otp:String)
    case getByMobileNumber(mobileNumber:String)
    case addCustomer(mobileNumber:String)
    case getActiveMapper(mapperId: String, cid: String)
    case updateMapperData(mapperData: [String: Any])
    case preApprovedEMI(customerId:Int,terminalId:Int)
    case emiPlans(transactionAmount:String)
    case emiInitiateTransaction(customerId:Int,terminalId:Int,transactionAmount:String,redemptionIds:[String]?)
    case emiCheckEligibility(brandName:String,emi:String,emiTransactionId:String,interestAmount:String,interestRate:String,paymentCredential:String,paymentCredentialType:String,processingFee:String,productType:String,tenure:Int,tenureType:String,transactionAmount:String,insuranceCharges:Double,otherCharges:Double,paymentFrequency:String,noOfInstallment:Int,customerConsent:String,customerConsentTime:String)
    case emiPaymentVerifyOtp(emiTransactionId:String,otp:String)
    case emiGenerateCustomerUrl(customerId:Int,terminalId:String,transactionAmount:String)
    case bankEMIResendOTP(requestId:String)
    case activationRequest(terminalIds:[String],productType:String,requestedBy:String)
    case checkAus(cidIds:[String])
    case reportingResults(reportName:String,request:[String:Any],fileType:String,sendEmail:Bool)
    case reportingResultsMultiple(reportList:[[String:Any]],fileType:String,sendEmail:Bool,rConfig: [String:Any])
    case checkFileStatus(requestId:String)
    case sendEmail(requestId:String)

    
    case getPreferencesSMSNotificationList(terminalList: [[String:String]])
    case getPreferencesSMSNotificationUpdateList(terminalList: [[String:Any]])
    case getPreferencesSMSNotificationHistory(pageNo: Int, pageSize: Int, terminalList: [[String:String]])
    case onboardVyaparify(terminalId : String)
    case getRedirectionDetails(terminalId : String)
    case getPosHistory(terminalIds : [String])
    case getPosToken(terminalIds : [String])
    case getPosDeviceDetails(terminalId : String)
    case getPosDefaultMdrRate(terminalId : String)
    case posEmail(applicationId:String)
    case posDownload(applicationId:String)

    case linkedDevices(members : [String], memberType : String)
    case requestOTP(imei:String,members : [String], memberType : String)
    case registerDevice(imei:String,deviceID : String, otp : String?,clientType:String,action:String,members:[String]?,memberType:String?)
    case deviceSetting(language:String, imei:String, deviceID:String)
    case actions(imei:String, action:String)
    case deviceLang
    case tidDetails(terminalId:String)
    case diagnostics(terminalId:String)
    case ampGenerateToken
    case v2TnCContent(module: String)
    case getConsent(module:String,loginId:String)
    case soundboxStatus(terminalIds:[String])
    case getTemplates
    case createTicket(terminalId: String, templateId: Int, ticketValues: [[String:Any]])
    case getDashboardData(terminals: [String])
    case getDeviceType(terminals: [String])
    case panToGst(terminalId: String)
    case sendOtpService(contextName: String, contextId: String, purpose: String, communicationType: String, communicationValue: String)
    case resendServiceOTP(requestId: String)
    case verifyServiceOTP(requestId: String, otp: String)
    case addTidReportEmail(tid:[String],reportEmail:String,userMobile:String)
    case getReportEmail(tids:[String],userMobile:String?)
    case editReportEmail(tid:[String],reportEmail:String,userMobile:String)
    case insuranceCyberProduct(terminalId: String)
    case cyberKnowMorw(applicationId: String)
    case insuranceSendOtp(contextName: String, contextId: String, purpose: String, communicationType: String, communicationValue: String, otherDetails: [String: String],otpChannel:String)
    case insuranceResendOtp(requestId: String,otpChannel:String)
    case insuranceVerifyOtp(requestId:String, otp: String)
    case insurancePurchase(applicationId: String)
    case insuranceDetails(terminalId: String)
    case fetchPanToGstin(applicationId: String, state: String, pincode: String, accountNumber: String)
    case handleCardTxnData(amount: String, terminalId: String, description: String, customerMobile: String, providerId: String, status: String, approvalCode: String, retrievalReferenceNumber: String, transactionId: String)
    case validateCardTxnSession
    case getSettlementSummaryData(terminalIdList: [String], startDate: String, endDate: String, dateType: String)
    case getSettlementDetails(terminalIds: [String], startDate: String, endDate: String, reqType: String, dateType: String)
    case getSettlementList(reqType: String, transactions: [[String: Any]])
    case getSettlementListSummary(terminalIdList: [String], dateType: String, startDate: String, endDate: String)
    case getTransactionSummaryData(txnid: [String])
    case deactivatedReason(terminalIds: [String])
    case memberAttributeFetch(memberType: String, memberValues: [String])
}

enum Swiftie: AppAuth {
    
    case swiftieAuthenticateUser(email: String, phone: String, returnURL: String, serviceType: String, TID: String, pan: String, gstin: String)
}

extension Swiftie {
    
    var encryptionType: EncryptionType {
        return .AES
    }
    
    var isRequestEncrypted: Bool {
        return true
    }
    
    var baseURL: URL {
        URL(string: BaseUrl.shared.swiftieBaseURL)!
//        URL(string: "https://swiftie.net/")!//UAT
//        URL(string: "https://registration.vendortopay.co.in:8010/")!Prod
    }
    
    var path: String {
        switch self {
        case .swiftieAuthenticateUser:
            return BaseUrl.shared.swiftiePathURL
//            return "ExternalMicroservice/api/Account/AuthenticateUser"//UAT
//            return "api/Account/AuthenticateUser"//Prod
        }
    }
    
    var fullURL: URL {
        return URL(string: baseURL.absoluteString + path)!
    }
    
    var method: String { return "POST" }
    
    var sampleData: Data { return Data() }
    
    var params1: [Any] {
        let params: [Any] = []
        return params
    }
    
    var params: [String : Any] {
        var params: [String : Any] = [:]
        switch self {
        
        case .swiftieAuthenticateUser(email: let email, phone: let phone, returnURL: let returnURL, serviceType: let serviceType, TID: let TID,  pan: let pan, gstin: let gstin):
            params = ["Email": email,"Phone": phone,"ReturnUrl": returnURL,"ServiceType": serviceType, "TID": TID]
            if !pan.isEmpty {
               params["PAN"] = pan
            }
            if !gstin.isEmpty {
                params["GSTIN"] = gstin
            }
        }
        return params
    }
    
    var headers: [String : String]? {
        var headers: [String : String] = [:]
        headers = ["Content-Type" : "application/json"]
        return headers
    }
}

protocol AppAuth {
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

enum EncryptionType {
    case AES
    case RSA_AES
}

enum OneAppAuth: AppAuth {
    
    case getKey
    case authMPos(terminalID: String)
    case validateUser(loginID: String, appVersion: String, devicePlatform: String)
    case verifyOTP(otp: String)
    case resendOTP
    case logout
    case verifyPin(loginId: String, authType: String, mPIN: String, fcmToken: String, simID: String, appInstanceId: String)
    case forgotPin(loginId: String)
    case setAuth(authType: String, mPin: String, isFaceEnabled: Bool, isTouchEnabled: Bool)
    case addUser(userMobile: String, userName: String, userEmailID: String)
    case modifyUser(userMobile: String, userName: String, userEmailID: String, accountStatus: Int)
    case addUserRole(userMobile: String, tidList: [(tid: String, role: String)])
    case modifyUserRole(userMobile: String, tidList: [(tid: String, role: String, userState: String)])
    case getAPKUrl(appVersion: String)
    case getUserProfile(loginID: String)
    case getUserProfileV2(loginID: String)
    case getUserRole
    case getUserTerminalList(tids: [String], mids: [String], cids: [String], cities: [String], locations: [String])
    case paymentSalesCardHDFC(terminalID: [String], salesCount: String, startDate: String, endDate: String)
    case paymentSalesCardMintoak(terminalID: [String], salesCount: String, startDate: String, endDate: String)
    case payementModeAndLoyaltyAPI(terminalID: String, salesCount: String, startDate: String, endDate: String)
    case cashPay(terminalId:String, amount: String, description: String, appTxnid: String, plCustId: String, customerMobileNumber:String, redemptionId: String)
    case QRPay(terminalId: String, amount: String, description: String, customerMobileNumber: String, appTxnid: String, pgId: String, plCustId: String, redemptionId: String)
    case LinkPay(terminalId: String, amount: String, description: String, customerMobileNumber: String, appTxnid: String, pgId: String, plCustId: String, redemptionId: String)
    case UPICollect(terminalId: String, amount: String, description: String, customerMobileNumber: String, payerVpa: String, appTxnid: String, pgId: String, plCustId: String, redemptionId: String)
    case UPILink(terminalId: String, plCustId: String, amount: String, description: String, customerMobileNumber: String, appTxnid: String, pgId: String, medium: String, redemptionId: String)
    case helpDesk
    case getHelpDeskDetails(terminalID: String)
    case switchTids(valueList: [[String:String]])
    case checkElegibleTid(terminals: [String])
    case getSettlementData(terminalIdList: [String], startDate: String, endDate: String)
    case paymentModeGraphViewAll(tidList: [String], startDate: String, endDate: String)
    case performanceViewAllWithDateRange(tidList: [String], startDate: String, endDate: String)
    case performanceViewAllWithServiceType(tidList: [String], serviceType: String)
    case miniStateMent(tidList: [String], type: String, txnType: [String], serviceType: String, count: String, startDate: String, endDate: String)
    case merchantTxnDetail(tidList: [String], type: String, txnType: [String], paymentType: [String]?, startDate: String, endDate: String)
    case getFeedback(tidList: [String], startDate: String, endDate: String)
    case paymentModeSummary(tidList: [String], startDate: String, endDate: String)
    case loanCategoryDetails
    case getFeedbackDetails(tidList: [String], startDate: String, endDate: String)
    case getComments(tidList: [String], startDate: String, endDate: String)
    case checkHistory(tidList: [String], startDate: String, endDate: String)
    
    case getMidSegments
    
    //PAYLATER DASHBOARD for 360 and MMP
    
    //@POST("HDFC360/getPayLaterFunnel")
    case getPayLaterFunnel360(tidList: [String], startDate: String, endDate: String)
    
    //@POST("HDFC/getPayLaterFunnel")
    case getPayLaterFunnelMMP(tidList: [String], startDate: String, endDate: String)
    
    //@POST("HDFC360/payLaterViewAll")
    ///type terminal for bizview
    case getPayLaterViewAll(tidList: [String], type: String)
    case plFunnelDetail(tidList: [String], since: String)
    
    //@POST("HDFC360/PLCardsDetail")
    ///type terminal for bizview, since in numeric string
    case getPayLaterCardDetail(tidList: [String], type: String, since: String)
    
    //@POST("HDFC/GetPLTxns")
    case getTxnDetailsMMP(tidList: [String])
    
    //@POST("HDFC360/GetPLTxns")
    case getTxnDetails360(tidList: [String])
    
    //@POST("HDFC/V1/GetPLTxns")
    case getPLFunnelViewAllDetailsMMP(tidList: [String], since: String)
    
    //@POST("HDFC360/getIndividualPlTxns")
    case getIndividualPlTxns(tidList: [String], since: String)
    
    //@POST("HDFC360/GetPLCustDetails")
    case getPLCustDetails360(tidList: [String], custId: String)
    
    //@POST("HDFC/V1/GetPLCustDetails")
    case getPLCustDetailsMMP(tidList: [String], custIdGetPLTxns: String)
//
//
//
//        //@POST("HDFC/PLFunnelDetails")
//        case getPLFunnelDetailsMMP()
//
//

    case getTransactionReport(tidList: [String], startDate: String, endDate: String, sendEmail: Bool)
    case getSettlementReport(tidList: [String], startDate: String, endDate: String, sendEmail: Bool)
 //   case generateTransactionReport(tidList: [String], startDate: String, endDate: String, sendEmail: String, startHour: String, endHour: String, paymentType: [String], transactionStates: [String])
 //   case generateSettlementReport(tidList: [String], startDate: String, endDate: String, sendEmail: String, startHour: String, endHour: String)

    case resendReceipt(mtxnid: String, msisdn: String)
    case mobNumberViewAll(tidList: [String], startDate: String, endDate: String)
    case getStoreRatingData(tidList: [String], startDate: String, endDate: String)
    case getStoreFeedbackComments(tidList: [String], startDate: String, endDate: String)
    case loyalty(mobile: String, terminalId: String)
    case getCustomer(customerMobile: String, tid: String)
    case addPayLaterTxn(customerMobile: String, tid: String, amount: String, address : String, name: String, description:String, pgId:String, isNew: Bool)
    case getBadges(tidList: [String])
    case bannerList
    case mdrCharges
    case businessCategory(location: String)
    case plDayDetail(tidList: [String], startDate: String, endDate: String, type: String)
    case v2pTxnList(phoneNumber: String)
    case loanBlocks
    case loanEligibility(amountID: Int, tenureID:Int)
    case LeaderBoard(tidList: [String], startDate: String, endDate: String)
    case ProductEnquiry(tid:String, cardNumber:String, customerMsisdn:String, prodType:String, appRefId:String, txnid:String)
    case VeriFyOTP(tid:String, otp:String, customerMsisdn:String, prodType:String, appRefId:String)
    case orderTrackList(tidList: [String])
    case creditToBankCardList(tidList: [String], startDate: String, endDate: String)
    case signUp(loginId: String, deviceId: String, appVersion: String)
    case pinCodeMapper(pinCode: String)
    case etbDOB(mobileNumber: String, dob: String)
    case etbPanDetails(mobileNumber: String, identifierName: String, identifierValue: String, pepFlag: String, lgCode: String, lcCode: String)
    case etbResendOTP(etbApplicationId: String, mobileNumber: String)
    case etbOtpVerify(applicationId: String, otp: String)
    case etbSetAuth(loginId: String, mPin: String, authType: String, isTouchIDEnabled: Bool, isFaceIDEnabled: Bool, fcmToken: String)
    case accountSelection(accountNumber: String, mcc: String, annualTurnOver: String, lgCode: String, lcCode: String, applicationId: String, emailId: String, vpa: String, address1: String, address2: String, address3: String, landmark: String, addressType: String, pinCode: String, city: String, state: String, gstn: String, shopName: String)
    case upiCheck(vpa: String, terminalId: String)
    case etbValidateQR(upi: String)
    case gstncheck(gstnNumber: String, applicationId: String)
    case etbTermsAndCondition(module: String)
    case capturemerchantconsent(agreementTime: String, isagree: Bool, loginId: String, metadata: String, module: String)
    case appliactionList(mobileNumber: String)
    case eligibilityCheck(mobileNumber: String, applicationId: String)
    case campaignList(tidList: [String], campaignId: String)
    case apnTxnDetail(txnid: [String])
    case campaignEventList
    case campaignTxnCountList(tidList: [String])
    case getCampaignResult(campaignId: String)
    case panAccountDetails(loginId: String, lastSixDigitAccountNo: String)
    case macSaveCampaignDetails(id:Int?,campaignType: String?,campaignStatus:String?,heading:String?,subHeading:String?,campaignName:String,description:String?,otherDetails:String?,campaignFormat:String?,caption:String?,campaignTemplateType:String?,scheduledDate:String?,campaignMetaDetails:[String:Any]?,backgroundImage:[String:Int]?,foregroundImage:[String:Int]?)
    case macGetCampaignInfo(campaignType: String?,campaignTemplateType:String?,status:String?,search:String?,pageNo:String?,pageSize:String?)
    case macGetImages(fileType:String,terminalId:String)
    case macUploadBase64Image(imageFileData:String,fileType:String,fileName:String)
    case macTermsAndConditions(module:String)
    case macCaptureMerchantConsent(isagree:Bool,agreementTime:String,metadata:String,module:String,tids:[String])
    case macCountByStatus
    case oarCreateOffer(id:Int?,offerConfiguration:[String:Any]?,banner:[String:Int]?,terminalId:[String]?,offerName: String?,offerDescription:String?,offerStartDate:String?,offerEndDate:String?,offerStatus:String?)
    case oarGetBannerTemplate
    case oarGetBannerImages(fileType:String,terminalId:String)
    case oarDashboardInfo(lowerTimeLimit:String,upperTimeLimit:String)
    case oarGetAggregationData(fromDate:String,toDate:String)
    case oarUploadBase64Image(imageFileData:String,fileType:String,fileName:String)
    case oarSaveBannerDetails(bannerType: String?,bannerMetaDetails:[String:Any]?,bannerFrame:[String:Int]?,bannerImage:[String:Int]?)


    case oarGetAggregationOfferIdData(fromDate:String,toDate:String,offerId:[String])
    case oarGetOfferByTimePeriod(lowerTime:String,upperTime:String)
    case oarTermsAndConditions(module:String)
    case oarCaptureMerchantConsent(isagree:Bool,agreementTime:String,metadata:String,module:String,tids:[String])
    case oarCheckEligibility(terminalId:[String]?,allTerminalId:[String]?,rewardCriteria:[[String:Any]]?,qualifyingPeriod:[String:Any]?)

    case oarGetAllOfferResult(sortBy:String,offerStatus:String,pageNo:String,pageSize:String,lowerDate:String,upperDate:String,rewardType:[String],paymentModes:[String],terminalIds:[String],searchQuery:String)
    case oarGetRedemptionsForTerminals(offerId:String,terminalId:[String])
    case oarGetOfferById(offerId:String)
    case getOfferCountByStatus(offerStatus:String)
    case oarPaymentDashboardBannerInfo(terminalIds:[String])
    case oarCustomOfferBannerInfo(mobile: String, tID: String, amount: String, mode: String)
    case oarCustomOfferBannerInfoV1(mobile: String, tID: [String], amount: String)
    case oarAddOfferRedeem(offerId: String, terminalId: String, customerId: String, offerAmount: String, transactionAmount: String, transactionStatus: String, paymentMode: String)
    case oarOfferRedemptionData(redemptionId: String)
    case v2pTermsAndCondition(module: String)
    case v2pCaptureMerchantConsent(isagree: Bool, agreementTime: String, metadata: String, module: String, tids: [String])
    case vendorPayDetails(terminalId: String)
    case activateQR(tid: String, vpa: String, rmCode: String)
    case qrDetailsList
    case generateTransactionReport(tidList: [String], startDate: String, endDate: String, sendEmail: Bool)
    case generateSettlementReport(tidList: [String], startDate: String, endDate: String, sendEmail: Bool)
    case generateCustomTransactionReport(tidList: [String], startDate: String, endDate: String, startHour: String, endHour: String, paymentType: [String], transactionStates: [String], sendEmail: Bool)
    case generateCustomSettlementReport(tidList: [String], startDate: String, endDate: String, startHour: String, endHour: String, paymentType: [String], transactionStates: [String], sendEmail: Bool)
    case bankProductHistory(terminalIds:[String],endDate:String,startDate:String,productName:String)
    case bankProductEligibility(terminalIds:[String],productName:String)
    case emiListProduct
    case activateDeactivateTids(terminalIds:[String],productName:String, status:String,reason:String)
    case getUserTerminalInfo
    case getMapper(terminalId: String)
    case emiVerifyOtp(productName:String, requestId:String, otp:String)
    case getByMobileNumber(mobileNumber:String)
    case addCustomer(mobileNumber:String)
    case getActiveMapper(mapperId: String, cid: String)
    case updateMapperData(mapperData: [String: Any])
    case preApprovedEMI(customerId:Int,terminalId:Int)
    case emiPlans(transactionAmount:String)
    case emiInitiateTransaction(customerId:Int,terminalId:Int,transactionAmount:String,redemptionIds:[String]?)
    case emiCheckEligibility(brandName:String,emi:String,emiTransactionId:String,interestAmount:String,interestRate:String,paymentCredential:String,paymentCredentialType:String,processingFee:String,productType:String,tenure:Int,tenureType:String,transactionAmount:String,insuranceCharges:Double,otherCharges:Double,paymentFrequency:String,noOfInstallment:Int,customerConsent:String,customerConsentTime:String)
    case emiPaymentVerifyOtp(emiTransactionId:String,otp:String)
    case emiGenerateCustomerUrl(customerId:Int,terminalId:String,transactionAmount:String)
    case bankEMIResendOTP(requestId:String)

    case qrDetailsWaiting(terminalId: String)
    case activationRequest(terminalIds:[String],productType:String,requestedBy:String)
    case checkAus(cidIds:[String])
    case reportingResults(reportName:String,request:[String:Any],fileType:String,sendEmail:Bool)
    case reportingResultsMultiple(reportList:[[String:Any]],fileType:String,sendEmail:Bool,rConfig: [String:Any])
    case checkFileStatus(requestId:String)
    case sendEmail(requestId:String)

    case getPreferencesSMSNotificationList(terminalList: [[String:String]])
    case getPreferencesSMSNotificationUpdateList(terminalList: [[String:Any]])
    case getPreferencesSMSNotificationHistory(pageNo: Int, pageSize: Int, terminalList: [[String:String]])
    case onboardVyaparify(terminalId : String)
    case getRedirectionDetails(terminalId : String)
    case getPosHistory(terminalIds : [String])
    case getPosToken(terminalIds : [String])
    case getPosDeviceDetails(terminalId : String)
    case getPosDefaultMdrRate(terminalId : String)
    case posEmail(applicationId:String)
    case posDownload(applicationId:String)

    case linkedDevices(members : [String], memberType : String)
    case requestOTP(imei:String,members : [String], memberType : String)
    case registerDevice(imei:String,deviceID : String, otp : String?,clientType:String,action:String,members:[String]?,memberType:String?)
    case deviceSetting(language:String, imei:String, deviceID:String)
    case actions(imei:String, action:String)
    case deviceLang
    case tidDetails(terminalId:String)
    case diagnostics(terminalId:String)
    case ampGenerateToken
    case v2TnCContent(module: String)
    case getConsent(module:String,loginId:String)
    case soundboxStatus(terminalIds:[String])
    case getTemplates
    case createTicket(terminalId: String, templateId: Int, ticketValues: [[String:Any]])
    case getDashboardData(terminals: [String])
    case getDeviceType(terminals: [String])
    case panToGst(terminalId: String)
    case sendOtpService(contextName: String, contextId: String, purpose: String, communicationType: String, communicationValue: String)
    case resendServiceOTP(requestId: String)
    case verifyServiceOTP(requestId: String, otp: String)
    case addTidReportEmail(tid:[String],reportEmail:String,userMobile:String)
    case getReportEmail(tids:[String],userMobile:String?)
    case editReportEmail(tid:[String],reportEmail:String,userMobile:String)

    case insuranceCyberProduct(terminalId: String)
    case cyberKnowMorw(applicationId: String)
    case insuranceSendOtp(contextName: String, contextId: String, purpose: String, communicationType: String, communicationValue: String, otherDetails: [String: String],otpChannel:String)
    case insuranceResendOtp(requestId: String,otpChannel:String)
    case insuranceVerifyOtp(requestId:String, otp: String)
    case insurancePurchase(applicationId: String)
    case insuranceDetails(terminalId: String)
    case fetchPanToGstin(applicationId: String, state: String, pincode: String, accountNumber: String)
    case handleCardTxnData(amount: String, terminalId: String, description: String, customerMobile: String, providerId: String, status: String, approvalCode: String, retrievalReferenceNumber: String, transactionId: String)
    case validateCardTxnSession
    case getSettlementSummaryData(terminalIdList: [String], startDate: String, endDate: String, dateType: String)
    case getSettlementDetails(terminalIds: [String], startDate: String, endDate: String, reqType: String, dateType: String)
    case getSettlementList(reqType: String, transactions: [[String: Any]])
    case getSettlementListSummary(terminalIdList: [String], dateType: String, startDate: String, endDate: String)
    case getTransactionSummaryData(txnid: [String])
    case deactivatedReason(terminalIds: [String])
    case memberAttributeFetch(memberType: String, memberValues: [String])
}

extension OneAppAuth {
    
    var encryptionType: EncryptionType {
        return .RSA_AES
    }

    var isRequestEncrypted: Bool {
        switch self {
        case .getKey:
            return false
        default:
            return true
        }
    }
}

extension OneAppAuth {
    var baseURL: URL {
        URL(string: BaseUrl.shared.apiBaseURL)!
    }
    
    var path: String {
        switch self {
        case .getKey: return "OneAppAuth/getKey"
        case.authMPos: return "HDFC360/V6/AuthMpos"
        case .validateUser:
//            return "OneAppAuth/ValidateUser" // for drop 2
//            return "OneAppAuth/v2/ValidateUser" // for drop 3
            return "OneAppAuth/v3/ValidateUser" // for drop 5.1
        case .verifyOTP:
            return "OneAppAuth/VerifyOTP"
        case .resendOTP:
            return "OneAppAuth/ResendOTP"
        case .verifyPin:
            return "OneAppAuth/VerifyPin"
        case .forgotPin:
            return "OneAppAuth/ForGotPin"
        case .setAuth:
            return "OneAppAuth/SetAuth"
        case .addUser:
            return "OneAppAuth/addUser"
        case .modifyUser:
            return "OneAppAuth/modifyUser"
        case .addUserRole:
            return "OneAppAuth/addRole"
        case .modifyUserRole:
            return "OneAppAuth/modifyRole"
        case .getAPKUrl:
            return "OneAppAuth/getApkUrl"
        case .getUserProfile:
            return "OneAppAuth/list/user-profile"
        case .getUserRole:
            return "OneAppAuth/list/user-role"
        case .getUserTerminalList:
            return "HDFC360/user-terminal-info"
        case .paymentSalesCardHDFC:
            
            return "HDFC360/V6/MerSaleCounterViewAll"
        case .paymentSalesCardMintoak:
            
            return "Mintoak/V9/DashBoard"
        case .payementModeAndLoyaltyAPI:
            return "OneAppAuth/V9/PayModes"
        case .cashPay:
            return "HDFC/OneApp/CashPay"
        case .QRPay:
            return "HDFC/OneApp/QRPay"
        case .LinkPay:
            return "HDFC/OneApp/v1/LinkPay"
        case .UPICollect:
            return "HDFC/OneApp/UPICollect"
        case .helpDesk:
            return "HDFC360/V5/HelpDesk"
        case .getHelpDeskDetails:
            return "HDFC/V9/GetHelpDeskDetails"
        case .paymentModeGraphViewAll:
            return "HDFC360/V6/PaymentModeGraphViewAll"
        case .performanceViewAllWithDateRange:
            return "HDFC360/V6/PerformanceViewAll"
        case .performanceViewAllWithServiceType:
            return "HDFC360/V6/PerformanceViewAll"
        case .miniStateMent:
//            return "HDFC360/OneApp/V1/MerchantTxnDetail"
  //          return "HDFC360/OneApp/V2/merchant-txn-detail"
            return "HDFC360/legacy/transaction-list"

        case .merchantTxnDetail:
//            return "HDFC360/OneApp/V1/MerchantTxnDetail"
//            return "HDFC360/OneApp/V2/merchant-txn-detail"
            return "HDFC360/legacy/transaction-list"
        case .getFeedback:
            return "HDFC360/V5/GetFeedBack"
        case .paymentModeSummary:
            return "HDFC360/V7/PaymentModeSummary"
        case .getFeedbackDetails:
            return "HDFC360/V5/GetFeedBackDetails"
        case .getComments:
            return "HDFC360/V5/GetComments"
        case .getPayLaterFunnel360: return "HDFC360/getPayLaterFunnel"
        case .getPayLaterFunnelMMP: return "HDFC/getPayLaterFunnel"
        case .getPayLaterViewAll: return "HDFC360/V1/payLaterViewAll"
        case .getPayLaterCardDetail: return "HDFC360/PLCardsDetail"
        case .getTxnDetailsMMP: return "HDFC/GetPLTxns"
        case .getTxnDetails360: return "HDFC360/GetPLTxns"
        case .getPLFunnelViewAllDetailsMMP: return "HDFC/V1/GetPLTxns"
        case .getIndividualPlTxns: return "HDFC360/getIndividualPlTxns"
        case .getPLCustDetails360: return "HDFC360/V1/GetPLCustDetails"
        case .getPLCustDetailsMMP: return "HDFC/V1/GetPLCustDetails"
        case .resendReceipt:
            return "HDFC/V5/ResendReceipt"
        case .mobNumberViewAll:
            return "HDFC360/V6/MobNumberViewAll"
        case .getStoreRatingData:
            return "universal/V5/GetFeedBackDetails"
        case .getStoreFeedbackComments:
            return "universal/V5/GetComments"
        case .getTransactionReport:
            return "HDFC360/V2/TransactionReport"
    //    case .generateTransactionReport:
//            return "HDFC360/V2/TransactionReport"
            
        case .loyalty:
            return "HDFC360/V6/Loyalty"
        case .getCustomer:
            return "HDFC/getCustomer"
        case .addPayLaterTxn:
            return "HDFC/OneApp/addPayLaterTxn"
        case .getBadges:
            return "HDFCCampaign/Campaign/V2/Badges"
        case .bannerList:
            return "HDFCCampaign/V2/bannerList"
        case .mdrCharges:
            return "HDFCMOB/etb/mdr-charges"
        case .businessCategory:
            return "HDFCCampaign/V2/bannerList"
        case .plDayDetail:
            return "HDFC360/V5/PLDayDetail"
        case .v2pTxnList:
            return "Xsell/v2p/v2/txnlist"
        case .loanBlocks:
            return "Xsell/loanBlocks"
        case .loanEligibility:
            return "Xsell/v1/loanEligibility"
        case .LeaderBoard:
            return "Xsell/XSell/LeaderBoard"
        case .ProductEnquiry:
            return "Xsell/XSell/ProductEnquiry"
        case .VeriFyOTP:
            return "Xsell/XSell/VeriFyOTP"
        case .orderTrackList:
            return "HDFCMOB/QRTracker"
        case .UPILink:
            return "HDFC/OneApp/UPILink"
        case .creditToBankCardList:
            return "HDFC360/V3/creditToBankCardList"// change version for drop4
        case .signUp:
            return "OneAppAuth/etb/v2/signup" // added v2 for drop5.1
        case .pinCodeMapper:
            return "HDFCMOB/etb/pincode-mapper"
        case .etbDOB:
            return "HDFCMOB/etb/dob"
        case .etbOtpVerify:
            return "HDFCMOB/etb/v2/verifyOTP" // added v2 for drop5.1
        case .etbSetAuth:
            return "OneAppAuth/SetAuth"
        case .etbResendOTP:
            return "HDFCMOB/etb/resendOTP"
        case .accountSelection:
            return "HDFCMOB/etb/v2/account-selection"
        case .gstncheck:
            return "HDFCMOB/etb/v2/gstncheck"
//        case .gstncheckNew:
//            return "HDFCMOB/etb/v2/gstncheck" //temp
        case .capturemerchantconsent:
            return "/HDFCMOB/tnc/v2/capture-merchant-consent"
        case .etbTermsAndCondition:
            return "HDFCMOB/tnc/select-details"
        case .appliactionList:
            return "HDFCMOB/etb/application_list"
        case .eligibilityCheck:
            return "HDFCMOB/etb/v2/eligibilityCheck"
        case .upiCheck:
            return "HDFC/V9/ValidateVPA"
        
        case .campaignList:
            return "HDFCCampaign/Campaign/V2/TxnCounts"
        case .apnTxnDetail:
//            return "HDFC360/txnDetail"
            return "HDFC360/v2/txn-detail"
        case .etbPanDetails:
            return "HDFCMOB/etb/v3/merchant_identifier"
        case .logout:
            return "OneAppAuth/logOut"
        case .checkHistory:
            return "HDFCMOB/ius/upi-settlement-type-change-history"
        case .checkElegibleTid:
            return "HDFCMOB/terminals/check-upi-instant-settlement-eligibility"
        case .switchTids:
            return "HDFCMOB/terminals/enable-instant-upi-settlement"
        case .campaignEventList:
            return "HDFCCampaign/Campaign/V3/campaignList"
        case .campaignTxnCountList:
            return "HDFCCampaign/Campaign/V5/TxnCounts"
        case .getCampaignResult:
            return "HDFCCampaign/Campaign/V2/getCampaign"
        case .plFunnelDetail:
            return "HDFC360/PLFunnelDetails"
        case .panAccountDetails:
            return "OneAppAuth/unblock-owner"
        case .getSettlementReport:
            return "HDFC360/getSettlementReport"
      //  case .generateSettlementReport:
//            return "HDFC360/getSettlementReport"
        case .macSaveCampaignDetails:
            return "mintoak/mac/api/campaign/saveCampaignDetails"
        case .macGetCampaignInfo:
            return "mintoak/mac/api/campaign/info"
        case .macGetImages:
            return "mintoak/mac/api/files/getFileByFileType"
        case .macUploadBase64Image:
            return "mintoak/mac/api/files/uploadBase64ToS3Bucket"
        case.macTermsAndConditions:
            return "HDFCMOB/tnc/select-details"
        case .macCaptureMerchantConsent:
            return "HDFCMOB/tnc/capture-merchant-consent"
        case .macCountByStatus:
            return "mintoak/mac/api/campaign/countByStatus"
        case .oarCreateOffer:
            return "mintoak/oar/api/offer/createAnOffer"
        case .oarGetBannerTemplate:
            return "mintoak/oar/api/banner/getBannerTemplates"
        case .oarGetBannerImages:
            return "mintoak/oar/api/files/getFileByFileType"

        case .oarDashboardInfo:
            return "mintoak/oar/api/offerDashboard/info"
        case .oarGetAggregationData:
            return "mintoak/oar/api/offerDashboard/getAggregationData"
        case .oarUploadBase64Image:
            return "mintoak/oar/api/files/uploadBase64ToS3Bucket"
        case .oarSaveBannerDetails:
            return "mintoak/oar/api/banner/saveBannerDetails"
        case .oarGetAggregationOfferIdData:
            return "mintoak/oar/api/offerDashboard/getAggregationData"
        case .oarGetOfferByTimePeriod:
            return "mintoak/oar/api/offer/getOfferByTimePeriod"
        case .oarGetAllOfferResult:
            return "mintoak/oar/api/filterAndSorting/getResults"
        case .oarTermsAndConditions:
            return "HDFCMOB/tnc/select-details"
        case .oarCaptureMerchantConsent:
            return "HDFCMOB/tnc/capture-merchant-consent"
        case .oarCheckEligibility:
            return "mintoak/customer/api/customerApi/getCount"
        case .oarGetRedemptionsForTerminals:
            return "mintoak/oar/api/offer/getRedemptionsForTerminals"
        case .oarGetOfferById:
            return "mintoak/oar/api/offer/getByOfferId"
        case .oarPaymentDashboardBannerInfo:
            return "mintoak/oar/api/offerDashboard/getLiveOfferCard"
        case .oarCustomOfferBannerInfo:
            return "mintoak/oar/api/offer/getCustomerOffers"
        case .oarCustomOfferBannerInfoV1:
            return "mintoak/oar/api/offer/getCustomerOffers/v1"
        case .oarAddOfferRedeem:
            return "mintoak/oar/api/offerRedemption/addOfferRedemption"
        case .etbValidateQR:
            return "HDFCMOB/validate-qr-code"
        case .oarOfferRedemptionData:
            return "mintoak/oar/api/offerRedemption/id"
        case .v2pTermsAndCondition:
            return "HDFCMOB/tnc/select-details"
        case .v2pCaptureMerchantConsent:
            return "HDFCMOB/tnc/capture-merchant-consent"
        case .vendorPayDetails:
            return "HDFCMOB/vendor-pay-details"
        case .getOfferCountByStatus:
            return "mintoak/oar/api/offerDashboard/getOfferCountByStatus"
        case .qrDetailsList, .qrDetailsWaiting:
            return "HDFCMOB/stock-merchant/qr-details"
        case .activateQR:
            return "HDFCMOB/stock-merchant/activate-qr"
        case .generateTransactionReport:
            return "HDFC360/V2/TransactionReport"
        case .generateSettlementReport:
            return "HDFC360/getSettlementReport"
        case .generateCustomTransactionReport:
            return "HDFC360/V2/TransactionReport"
        case .generateCustomSettlementReport:
            return "HDFC360/getSettlementReport"
        case .bankProductHistory:
            return "HDFCMOB/bank-product/history"
        case .bankProductEligibility:
            return "HDFCMOB/bank-product/eligibility"
        case .emiListProduct:
            return "emi/list-product"
        case .activateDeactivateTids:
            return "HDFCMOB/bank-product/activate-deactivate"
        case .getUserTerminalInfo:
            return "HDFC360/user-terminal-info"
        case .getMapper: return "HDFCMOB/data-mapper/get-mapper"
        case .emiVerifyOtp:
            return "HDFCMOB/bank-product/verify-otp"
        case .getByMobileNumber:
            return "mintoak/customer/api/info/mobile"
        case .addCustomer:
            return "mintoak/customer/api/info/addCustomer"
        case .getActiveMapper: return "HDFCMOB/data-mapper/activate-mapper"
        case .updateMapperData:
            return "HDFCMOB/data-mapper/update-mapper"
        case .preApprovedEMI:
            return "emi/pre-approved-emi"
        case .emiPlans:
            return "emi/plans"
        case .emiInitiateTransaction:
            return "emi/initiate-transaction"
        case .emiCheckEligibility:
            return "emi/check-eligibility"
        case .emiPaymentVerifyOtp:
            return "emi/verify-otp"
        case .emiGenerateCustomerUrl:
            return "emi/generate-customer-url"
        case .bankEMIResendOTP:
            return "HDFCMOB/bank_product/resend-otp"

        case .getSettlementData:
            return "HDFC360/settlement-data"
        case .loanCategoryDetails:
            return "Xsell/v2/loan-eligibility"
        case .getMidSegments:
            return "HDFC360/segment/merchant-info"
        case .activationRequest:
            return "HDFCMOB/bank-product/activation/request"
        case .checkAus:
            return "HDFCMOB/check-aus"
        case .reportingResults:
            return "SEG2/api/appReports/createAppReports"
        case .reportingResultsMultiple:
            return "SEG2/api/appReports/createAppReports"
        case .checkFileStatus:
            return "SEG2/api/appReports/checkFileStatus"
        case .sendEmail:
            return "SEG2/api/appReports/sendEmail"

        case .getPreferencesSMSNotificationList:
            return "SEG2/communication/api/subscribers/getpreferences"
        case .getPreferencesSMSNotificationHistory:
            return "SEG2/communication/api/subscribers/getpreferencelogs"
        case .getPreferencesSMSNotificationUpdateList:
            return "SEG2/communication/api/subscribers/preferences"
        case .onboardVyaparify:
            return "HDFCMOB/onboard-vyaprify"
        case .getRedirectionDetails:
            return "HDFCMOB/get-redirection-details"
        case .getPosHistory:
            return "HDFCMOB/pos/history"
        case .getPosToken:
            return "OneAppAuth/generate-token"
        case .getPosDeviceDetails:
            return "HDFCMOB/pos/device-price-details"
        case .getPosDefaultMdrRate:
            return "HDFCMOB/pos/default-mdr-rate"
        case .posEmail:
            return "HDFCMOB/pos/email"
        case .posDownload:
            return "HDFCMOB/pos/download"
        case .linkedDevices:
            return "soundbox/linked-devices"
        case .requestOTP:
            return "soundbox/request-otp"
        case .registerDevice:
            return "soundbox/register-devices"
        case .deviceSetting:
            return "soundbox/device-settings"
        case .actions:
            return "soundbox/actions"
        case .deviceLang:
            return "soundbox/device-languages"
        case .tidDetails:
            return "HDFCMOB/soundbox/tid-linking-details"
        case .diagnostics:
            return "soundbox/diagnostics"
        case .ampGenerateToken:
            return "HDFCMOB/vas/generate-token"
        case .v2TnCContent:
            return "HDFCMOB/tnc/select-details"
        case .getConsent:
            return "HDFCMOB/tnc/get-consent-for-loginId"

        case .soundboxStatus:
            return "HDFCMOB/soundbox/status"
        case .getTemplates:
            return "sam/tickets/templates"
        case .createTicket:
            return "sam/tickets/create"
        case .getDashboardData:
            return "sam/tickets/v2/dashboard"
        case .getDeviceType:
            return "HDFCMOB/terminals/bank-device-type"
        case .panToGst:
            return "HDFCMOB/terminals/pan-to-gst"
        case .sendOtpService:
            return "sam/send-otp"
        case .resendServiceOTP:
            return "sam/resend-otp"
        case .verifyServiceOTP:
            return "sam/verify-otp"
        case .addTidReportEmail:
            return "OneAppAuth/add/tid-report-email"
        case .getReportEmail:
            return "OneAppAuth/get/tid-report-email"
        case .editReportEmail:
            return "OneAppAuth/edit/tid-report-email"
        case .getUserProfileV2:
            return "OneAppAuth/list/v2/user-profile"
        case .insuranceCyberProduct:
            return "Xsell/cyber-product"
        case .cyberKnowMorw:
            return "Xsell/cyber-know-more"
        case .insuranceSendOtp:
            return "sam/send-otp"
        case .insuranceResendOtp:
            return "sam/resend-otp"
        case .insuranceVerifyOtp:
            return "sam/verify-otp"
        case .insurancePurchase:
            return "Xsell/cyber-purchase"
        case .insuranceDetails:
            return "Xsell/cyber-insurance-details"
        case .fetchPanToGstin:
           // return "fetch-pan-to-gstin"
            return "HDFCMOB/etb/fetch-pan-to-gstin"
        case .handleCardTxnData:
            return "HDFC/V2/CardTxnHandler"
        case .validateCardTxnSession:
            return "OneAppAuth/validateSession"
        case .getSettlementSummaryData:
            return "settlement/settlement-summary"
        case .getSettlementDetails:
            return "settlement/settlement-details"
        case .getSettlementList:
            return "settlement/settlement-details"
        case .getSettlementListSummary:
            return "settlement/settlement-summary"
        case .getTransactionSummaryData:
            return "HDFC360/legacy/txn-detail"
        case .deactivatedReason:
            return "HDFCMOB/deactivated-tids-risk-reason"
        case .memberAttributeFetch:
            return "HDFCMOB/member-attribute/fetch"
        }
    }
    
    var fullURL: URL {
        return URL(string: baseURL.absoluteString + path)!
    }
    
    var method: String {
        "POST"
    }
    
    var getMethod: String {
        "GET"
    }
    
    var sampleData: Data {
        Data()
    }
    
    var params1: [Any] {
        var params: [Any] = []
        
        switch self {
        case .switchTids(valueList: let valueList):
            params = valueList
        case .getKey: break
        case .authMPos(terminalID: _): break
            
        case .validateUser(loginID: _, appVersion: _, devicePlatform: _): break
            
        case .verifyOTP(otp: _): break
            
        case .resendOTP: break
            
        case .logout: break
            
        case .verifyPin(loginId: _, authType: _, mPIN: _, fcmToken: _, simID: _, appInstanceId: _): break
            
        case .forgotPin(loginId: _): break
            
        case .setAuth(authType: _, mPin: _, isFaceEnabled: _, isTouchEnabled: _): break
            
        case .addUser(userMobile: _, userName: _, userEmailID: _): break
            
        case .modifyUser(userMobile: _, userName: _, userEmailID: _, accountStatus: _): break
            
                      case .addUserRole(userMobile: _, tidList: _): break
            
        case .modifyUserRole(userMobile: _, tidList: _): break
            
        case .getAPKUrl(appVersion: _): break
            
        case .getUserProfile(loginID: _): break
         
        case .getUserProfileV2(loginID: _): break

        case .getUserRole: break
            
        case .getUserTerminalList(tids: _, mids: _, cids: _, cities: _, locations: _): break
            
        case .paymentSalesCardHDFC(terminalID: _, salesCount: _, startDate: _, endDate: _): break
            
        case .paymentSalesCardMintoak(terminalID: _, salesCount: _, startDate: _, endDate: _): break
            
        case .payementModeAndLoyaltyAPI(terminalID: _, salesCount: _, startDate: _, endDate: _): break
            
        case .cashPay(terminalId: _, amount: _, description: _, appTxnid: _, plCustId: _, customerMobileNumber: _, redemptionId: _): break
            
        case .QRPay(terminalId: _, amount: _, description: _, customerMobileNumber: _, appTxnid: _, pgId: _, plCustId: _, redemptionId: _): break
            
        case .LinkPay(terminalId: _, amount: _, description: _, customerMobileNumber: _, appTxnid: _, pgId: _, plCustId: _, redemptionId: _): break
            
        case .UPICollect(terminalId: _, amount: _, description: _, customerMobileNumber: _, payerVpa: _, appTxnid: _, pgId: _, plCustId: _, redemptionId: _): break
            
        case .UPILink(terminalId: _, plCustId: _, amount: _, description: _, customerMobileNumber: _, appTxnid: _, pgId: _, medium: _, redemptionId: _): break
            
        case .helpDesk: break
            
        case .getHelpDeskDetails(terminalID: _): break
            
        case .checkElegibleTid(terminals: _): break
            
        case .paymentModeGraphViewAll(tidList: _, startDate: _, endDate: _): break
            
        case .performanceViewAllWithDateRange(tidList: _, startDate: _, endDate: _): break
            
        case .performanceViewAllWithServiceType(tidList: _, serviceType: _): break
            
        case .miniStateMent(tidList: _, type: _, txnType: _, serviceType: _, count: _,  startDate: _, endDate: _): break
            
        case .merchantTxnDetail(tidList: _, type: _, txnType: _, paymentType: _, startDate: _, endDate: _): break
            
        case .getFeedback(tidList: _, startDate: _, endDate: _): break
            
        case .paymentModeSummary(tidList: _, startDate: _, endDate: _): break
            
        case .getFeedbackDetails(tidList: _, startDate: _, endDate: _): break
            
        case .getComments(tidList: _, startDate: _, endDate: _): break
            
        case .checkHistory(tidList: _, startDate: _, endDate: _): break
            
        case .getPayLaterFunnel360(tidList: _, startDate: _, endDate: _): break
            
        case .getPayLaterFunnelMMP(tidList: _, startDate: _, endDate: _): break
            
        case .getPayLaterViewAll(tidList: _, type: _): break
            
        case .getPayLaterCardDetail(tidList: _, type: _, since: _): break
            
        case .getTxnDetailsMMP(tidList: _): break
            
        case .getTxnDetails360(tidList: _): break
            
        case .getPLFunnelViewAllDetailsMMP(tidList: _, since: _): break
            
        case .getIndividualPlTxns(tidList: _, since: _): break
            
        case .getPLCustDetails360(tidList: _, custId: _): break
            
        case .getPLCustDetailsMMP(tidList: _, custIdGetPLTxns: _): break
            
        case .getTransactionReport(tidList: _, startDate: _, endDate: _, sendEmail: _): break
            
   //     case .generateTransactionReport(tidList: _, startDate: _, endDate: _, sendEmail: _,  startHour: _, endHour: _, paymentType: _, transactionStates: _): break
            
        case .resendReceipt(mtxnid: _, msisdn: _): break
            
        case .mobNumberViewAll(tidList: _, startDate: _, endDate: _): break
            
        case .getStoreRatingData(tidList: _, startDate: _, endDate: _): break
            
        case .getStoreFeedbackComments(tidList: _, startDate: _, endDate: _): break
            
        case .loyalty(mobile: _, terminalId: _): break
            
        case .getCustomer(customerMobile: _, tid: _): break
            
        case .addPayLaterTxn(customerMobile: _, tid: _, amount: _, address: _, name: _,  description: _, pgId: _, isNew: _): break
            
        case .getBadges(tidList: _): break
            
        case .bannerList: break
            
        case .mdrCharges: break
            
        case .businessCategory(location: _): break
            
        case .plDayDetail(tidList: _, startDate: _, endDate: _, type: _): break
            
        case .v2pTxnList(phoneNumber: _): break
            
        case .loanBlocks: break
            
        case .loanEligibility(amountID: _, tenureID: _): break
            
        case .LeaderBoard(tidList: _, startDate: _, endDate: _): break
            
        case .ProductEnquiry(tid: _, cardNumber: _, customerMsisdn: _, prodType: _, appRefId:  _, txnid: _): break
            
        case .VeriFyOTP(tid: _, otp: _, customerMsisdn: _, prodType: _, appRefId: _): break
            
        case .orderTrackList(tidList: _): break
            
        case .creditToBankCardList(tidList: _, startDate: _, endDate: _): break
            
        case .signUp(loginId: _): break
            
        case .pinCodeMapper(pinCode: _): break
            
        case .etbDOB(mobileNumber: _, dob: _): break
            
        case .etbPanDetails(mobileNumber: _, identifierName: _, identifierValue: _, pepFlag: _, lgCode: _, lcCode: _): break
            
        case .etbResendOTP(etbApplicationId: _, mobileNumber: _): break
            
        case .etbOtpVerify(applicationId: _, otp: _): break
            
        case .etbSetAuth(loginId: _, mPin: _, authType: _, isTouchIDEnabled: _,  isFaceIDEnabled: _, fcmToken: _): break
            
        case .accountSelection(accountNumber: _, mcc: _, annualTurnOver: _, lgCode: _, lcCode: _, applicationId: _, emailId: _, vpa: _, address1: _, address2: _, address3: _, landmark: _, addressType: _, pinCode: _, city: _, state: _, gstn: _, shopName: _): break
            
        case .upiCheck(vpa: _, terminalId: _): break
            
        case .gstncheck(gstnNumber: _, applicationId: _): break
            
        case .capturemerchantconsent(agreementTime: _, isagree: _, loginId: _, metadata: _, module: _): break
            
        case .etbTermsAndCondition(module: _): break
            
        case .appliactionList(mobileNumber: _): break
            
        case .eligibilityCheck(mobileNumber: _, applicationId: _): break
            
        case .campaignList(tidList: _, campaignId: _): break
            
        case .campaignEventList: break
            
        case .campaignTxnCountList(tidList: _): break
            
        case .apnTxnDetail(txnid: _): break
            
        case .getCampaignResult(campaignId: _): break
        case .getSettlementReport(tidList: _, startDate: _, endDate: _, sendEmail: _):
            break
    //    case .generateSettlementReport(tidList: _, startDate: _, endDate: _, sendEmail: _, startHour: _, endHour: _): break
            
        case .plFunnelDetail(tidList: _, since: _): break
            
        case .panAccountDetails(loginId: _, lastSixDigitAccountNo: _): break
        case .macSaveCampaignDetails(id: _,campaignType: _, campaignStatus: _, heading: _, subHeading: _, campaignName: _, description: _, otherDetails: _, campaignFormat: _, caption: _, campaignTemplateType: _, scheduledDate: _, campaignMetaDetails: _, backgroundImage: _, foregroundImage: _) :
            break
        case .macGetCampaignInfo(campaignType: _, campaignTemplateType: _, status: _, search: _, pageNo: _, pageSize: _):
            break
        case .macGetImages(fileType: _, terminalId: _):
            break
        case .macUploadBase64Image(imageFileData: _, fileType: _, fileName: _):
            break
        case .macTermsAndConditions(module: _):
            break
        case .macCaptureMerchantConsent(isagree: _, agreementTime: _, metadata: _, module: _, tids: _):
            break
        case .macCountByStatus:
            break
        case .oarCreateOffer(id: _,offerConfiguration: _, banner: _, terminalId: _, offerName: _, offerDescription: _, offerStartDate: _, offerEndDate: _,offerStatus:_):
            break
        case .oarGetBannerTemplate:
            break
        case .oarGetBannerImages(fileType:_,terminalId:_):
            break


        case .oarDashboardInfo(lowerTimeLimit: _, upperTimeLimit: _):
            break
        case .oarGetAggregationData(fromDate: _, toDate: _):
            break
        case .oarUploadBase64Image(imageFileData: _, fileType: _, fileName: _):
            break
        case .oarSaveBannerDetails(bannerType: _, bannerMetaDetails: _, bannerFrame: _, bannerImage: _):
            break
        case .oarGetAggregationOfferIdData(fromDate: _, toDate: _, offerId: _):
            break
        case .oarGetOfferByTimePeriod(lowerTime: _, upperTime: _):
            break
        case .oarGetAllOfferResult(sortBy: _,offerStatus: _, pageNo: _, pageSize: _, lowerDate: _, upperDate: _, rewardType: _, paymentModes: _, terminalIds: _, searchQuery: _):
            break
        case .oarGetRedemptionsForTerminals(offerId: _,terminalId: _):
            break
        case .oarGetOfferById(offerId: _):
            break
        case .getOfferCountByStatus(offerStatus: _):
            break
        case .oarTermsAndConditions(module: _):
            break
        case .oarCaptureMerchantConsent(isagree: _, agreementTime: _, metadata: _, module: _, tids: _):
            break
        case .oarCheckEligibility(terminalId: _, allTerminalId: _, rewardCriteria: _, qualifyingPeriod: _):
            break
        case .oarPaymentDashboardBannerInfo(terminalIds: _):
            break
        case .oarCustomOfferBannerInfo(mobile: _, tID: _, amount: _, mode: _):
            break
        case .oarCustomOfferBannerInfoV1(mobile: _, tID: _, amount: _):
            break
        case .oarAddOfferRedeem(offerId: _, terminalId: _, customerId: _, offerAmount: _, transactionAmount: _, transactionStatus: _, paymentMode: _):
            break
        case .oarOfferRedemptionData(redemptionId: _):
            break
        case .etbValidateQR(upi: _): break
        case .v2pTermsAndCondition(module: _): break
        case .v2pCaptureMerchantConsent(isagree: _, agreementTime: _, metadata: _, module: _, tids: _): break
        case .vendorPayDetails(terminalId: _): break
        case .qrDetailsList: break
        case .activateQR(tid: _, vpa: _, rmCode: _): break
        case .generateTransactionReport(tidList: _, startDate: _, endDate: _, sendEmail: _): break
        case .generateSettlementReport(tidList: _, startDate: _, endDate: _, sendEmail: _): break
        case .generateCustomTransactionReport(tidList: _, startDate: _, endDate: _, startHour: _, endHour: _, paymentType: _, transactionStates: _, sendEmail: _): break
        case .generateCustomSettlementReport(tidList: _, startDate: _, endDate: _, startHour: _, endHour: _, paymentType: _, transactionStates: _, sendEmail: _): break
        case .bankProductHistory(terminalIds: _,endDate: _,startDate: _,productName: _): break
        case .bankProductEligibility(terminalIds: _,productName: _): break
        case .emiListProduct : break
        case .activateDeactivateTids(terminalIds: _,productName: _, status: _,reason: _) :
            break
        case .getUserTerminalInfo: break
        case .getMapper(terminalId: _): break
        case .emiVerifyOtp(productName: _, requestId: _, otp: _):
            break
        case .getByMobileNumber(mobileNumber: _):
            break
        case .addCustomer(mobileNumber: _):
            break
        case .getActiveMapper(mapperId: _, cid: _): break
        case .updateMapperData(mapperData: _): break
        case .preApprovedEMI(customerId: _,terminalId: _):
            break
        case .emiPlans(transactionAmount: _):
            break
        case .emiInitiateTransaction(customerId: _,terminalId: _,transactionAmount: _,redemptionIds: _):
            break
        case .emiCheckEligibility(brandName: _,emi: _,emiTransactionId: _,interestAmount: _,interestRate: _,paymentCredential: _,paymentCredentialType: _,processingFee: _,productType: _,tenure: _,tenureType: _,transactionAmount: _,insuranceCharges: _,otherCharges: _,paymentFrequency: _,noOfInstallment: _,customerConsent: _,customerConsentTime: _):
            break
        case .emiPaymentVerifyOtp(emiTransactionId: _,otp: _):
            break
        case .emiGenerateCustomerUrl(customerId: _,terminalId: _,transactionAmount: _):
            break
        case .bankEMIResendOTP(requestId: _):
            break

        case .getSettlementData(terminalIdList: _, startDate: _, endDate: _):
            break
        case .loanCategoryDetails: break
        case .getMidSegments: break
        case .qrDetailsWaiting(terminalId: _): break
        case .activationRequest(terminalIds: _, productType: _, requestedBy: _):
            break

        case .checkAus(cidIds: _):
            break
        case .reportingResults(reportName: _, request: _, fileType: _, sendEmail: _):
            break
        case .reportingResultsMultiple(reportList: _, fileType: _, sendEmail: _, rConfig: _):
            break
        case .checkFileStatus(requestId: _):
            break
        case .sendEmail(requestId: _):
            break
        case .getPreferencesSMSNotificationList(terminalList: let terminalList):
            params = terminalList
            break
        case .getPreferencesSMSNotificationHistory(pageNo: _, pageSize: _, terminalList: _):
            break
        case .getPreferencesSMSNotificationUpdateList(terminalList: let terminalList):
            params = terminalList
            break
        case .onboardVyaparify(terminalId : _):
            break
        case .getRedirectionDetails(terminalId : _):
            break
        case .getPosHistory(terminalIds: _):
            break
        case .getPosToken(terminalIds: _): break
        case .getPosDeviceDetails(terminalId : _):
            break
        case .getPosDefaultMdrRate(terminalId : _):
            break
        case .posEmail(applicationId: _):
            break
        case .posDownload(applicationId: _):
            break

        case .linkedDevices(members: _, memberType: _):
            break
        case .requestOTP(imei: _,members : _, memberType : _):
            break
        case .registerDevice(imei: _, deviceID: _, otp: _, clientType: _, action: _, members: _, memberType: _):
            break
        case .deviceSetting(language: _, imei: _, deviceID: _):
            break
        case .actions(imei: _, action: _):
            break
        case .deviceLang:
            break
        case .tidDetails(terminalId: _):
            break

        case .diagnostics(terminalId: _):
            break
        case .ampGenerateToken:
            break
        case .v2TnCContent(module: _):
            break
        case .getConsent(module: _, loginId: _):
             break
        case .soundboxStatus(terminalIds: _):
            break
        case .getTemplates:
            break
        case .createTicket(terminalId: _, templateId: _, ticketValues: _):
            break
        case .getDashboardData(terminals: _):
            break
        case .getDeviceType(terminals: _):
            break
        case .panToGst(terminalId: _):
            break
        case .sendOtpService(contextName: _, contextId: _, purpose: _, communicationType: _, communicationValue: _):
            break
        case .resendServiceOTP(requestId: _):
            break
        case .verifyServiceOTP(requestId: _, otp: _):
            break
        case .addTidReportEmail(tid: _,reportEmail: _,userMobile: _):
            break
        case .getReportEmail(tids: _,userMobile: _):
            break
        case .editReportEmail(tid: _, reportEmail: _,userMobile: _):
            break
        case .insuranceCyberProduct(terminalId: _):
            break
        case .cyberKnowMorw(applicationId: _):
            break
        case .insuranceSendOtp(contextName: _, contextId: _, purpose: _, communicationType: _, communicationValue: _, otherDetails: _, otpChannel: _):
            break
        case .insuranceResendOtp(requestId: _,otpChannel: _):
            break
        case .insuranceVerifyOtp(requestId: _, otp: _):
            break
        case .insurancePurchase(applicationId: _):
            break
        case .insuranceDetails(terminalId: _):
            break
        case .fetchPanToGstin(applicationId: _, state: _, pincode: _, accountNumber: _):
            break
            
        case .validateCardTxnSession: break
            
        case .handleCardTxnData(amount: _, terminalId: _, description: _, customerMobile: _, providerId: _, status: _, approvalCode: _, retrievalReferenceNumber: _, transactionId: _): break
        case .getSettlementSummaryData(terminalIdList: _, startDate: _, endDate: _, dateType: _): break
        case .getSettlementDetails(terminalIds: _, startDate: _, endDate: _, reqType: _, dateType: _):
            break
        case .getSettlementList(reqType: _, transactions: _):
            break
        case .getSettlementListSummary(terminalIdList: _, dateType: _, startDate: _, endDate: _):
            break
        case .getTransactionSummaryData(txnid: _): break
        case .deactivatedReason(terminalIds: _):
            break
        case .memberAttributeFetch(memberType: _, memberValues: _ ):
            break
        }
        
        return params
    }
    
    var params: [String : Any] {
        var params: [String : Any] = [:]
        switch self {
            
        case .getKey: break
            
        case .authMPos(terminalID: let terminalID):
            params = ["terminalId": terminalID]
            
        case .validateUser(loginID: let loginID, appVersion: let appVersion, devicePlatform: let devicePlatform):
            params = ["loginId" : loginID, "appVersion" : appVersion, "devicePlatform": devicePlatform]
        case .verifyOTP(otp: let otp):
            params = ["otp" : otp]
            
        case .resendOTP: break
        case .verifyPin(loginId: let loginId, authType: let authType, mPIN: let mPIN, fcmToken: let fcmToken, simID: let simID, appInstanceId: let appInstanceId):
            // params = ["authType":authType,"mPin":mPIN]
            // params = ["loginId":LoginAuth.shared.storedUsername, "authType":authType,"mPin":mPIN, "fcmToken": NetWorker.deviceID]
            // params = ["authType":authType,"mPin":mPIN, "fcmToken": NetWorker.deviceID]
            params = ["loginId":loginId, "authType": authType, "mPin": mPIN, "fcmToken": fcmToken, "simID": simID, "appInstanceId": appInstanceId]
        case .forgotPin(loginId: let loginId):
            params = ["loginId":loginId]
            
        case .setAuth(authType: let authType, mPin: let mPin, isFaceEnabled: let isFaceEnabled, isTouchEnabled: let isTouchEnabled):
            if authType == "mPin" {
                params = ["authType":authType,"mPin":mPin,"isFaceIDEnabled":isFaceEnabled,"isTouchIDEnabled":isTouchEnabled]
            } else if isFaceEnabled {
                params = ["authType":authType,"mPin":mPin,"isFaceIDEnabled":isFaceEnabled]
            } else if isTouchEnabled {
                params = ["authType":authType,"mPin":mPin,"isTouchIDEnabled":isTouchEnabled]
            } else {
                params = ["authType":authType,"mPin":mPin,"isFaceIDEnabled":isFaceEnabled]
            }
            
        case .addUser(userMobile: let userMobile, userName: let userName, userEmailID: let userEmailID):
            params = ["userName":userName,"userMobile":userMobile,"userEmailID":userEmailID]
            
        case .modifyUser(userMobile: let userMobile, userName: let userName, userEmailID: let userEmailID, accountStatus: _):
            params = ["userName":userName,"userMobile":userMobile,"userEmailID":userEmailID]
            
        case .addUserRole(userMobile: let userMobile, tidList: let tidList):
            params = ["userMobile" : userMobile, "tidList" : tidList.map({ ["tid": $0.tid, "role" : $0.role] })]
            
        case .modifyUserRole(userMobile: let userMobile, tidList: let tidList):
            params = ["userMobile" : userMobile, "tidList" : tidList.map({ ["tid": $0.tid, "role" : $0.role, "userState" : $0.userState] })]
            
        case .getAPKUrl/*(appVersion: let appVersion)*/: break
            
        case .getUserProfile(loginID: let loginID):
            params = ["loginIds" : [loginID]]
            
        case .getUserProfileV2(loginID: let loginID):
            params = ["loginIds" : [loginID]]
            
        case .getUserRole: break
        case .getUserTerminalList/*(tids: let tids, mids: let mids, cids: let cids, cities: let cities, locations: let locations)*/: break
            
        case .paymentSalesCardMintoak(let terminalID, let salesCount, let startDate, let endDate):
            params = ["tidList" : terminalID, "saleCounter" : salesCount, "startDate" : startDate, "endDate" : endDate]
            break
        case .paymentSalesCardHDFC(let terminalID, let salesCount, let startDate, let endDate):
            params = ["tidList" : terminalID, "saleCounter" : salesCount, "startDate" : startDate, "endDate" : endDate]
            break
        case .payementModeAndLoyaltyAPI/*(terminalID: let terminalID, salesCount: let salesCount, startDate: let startDate, endDate: let endDate)*/:
            break
        case .cashPay(terminalId: let terminalId, amount: let amount, description: let description, appTxnid: let appTxnid, plCustId: let plCustId, customerMobileNumber: let customerMobileNumber, redemptionId: let redemptionId):
            params = ["terminalId":terminalId, "amount":amount, "description":description, "appTxnid":appTxnid, "customerMobileNumber":customerMobileNumber, "pgId": "1", "redemptionId": redemptionId.count > 0 ? [redemptionId] : []]
            if !plCustId.isEmpty {
                params["plCustId"] = plCustId
            }
            break
        case .QRPay(terminalId: let terminalId, amount: let amount, description: let description, customerMobileNumber: let customerMobileNumber, appTxnid: let appTxnid, pgId: let pgId, plCustId: let plCustId, redemptionId: let redemptionId):
            params = ["terminalId":terminalId, "amount":amount, "description":description, "appTxnid":appTxnid, "customerMobileNumber":customerMobileNumber, "pgId": pgId, "redemptionId": redemptionId.count > 0 ? [redemptionId] : []]
            if !plCustId.isEmpty {
                params["plCustId"] = plCustId
            }
            break
        case .LinkPay(terminalId: let terminalId, amount: let amount, description: let description, customerMobileNumber: let customerMobileNumber, appTxnid: let appTxnid, pgId: let pgId, plCustId: let plCustId, redemptionId: let redemptionId):
            params = ["terminalId":terminalId, "amount":amount, "description":description, "appTxnid":appTxnid, "customerMobileNumber":customerMobileNumber, "pgId": pgId, "redemptionId": redemptionId.count > 0 ? [redemptionId] : []]
            if !plCustId.isEmpty {
                params["plCustId"] = plCustId
            }
            break
        case .UPILink(terminalId: let terminalId, plCustId: let plCustId, amount: let amount, description: let description, customerMobileNumber: let customerMobileNumber, appTxnid: let appTxnid, pgId: let pgId, medium: let medium, redemptionId: let redemptionId):
            params = ["terminalId":terminalId, "amount":amount, "description":description, "appTxnid":appTxnid, "medium": medium, "customerMobileNumber":customerMobileNumber, "pgId": pgId, "redemptionId": redemptionId.count > 0 ? [redemptionId] : []]
            if !plCustId.isEmpty {
                params["plCustId"] = plCustId
            }
            break
        case .UPICollect(terminalId: let terminalId, amount: let amount, description: let description, customerMobileNumber: let customerMobileNumber, payerVpa: let payerVpa, appTxnid: let appTxnid, pgId: let pgId, plCustId: let plCustId, redemptionId: let redemptionId):
            params = ["terminalId":terminalId, "amount":amount, "description":description, "appTxnid":appTxnid, "payerVpa":payerVpa, "customerMobileNumber":customerMobileNumber, "pgId": pgId, "redemptionId": redemptionId.count > 0 ? [redemptionId] : []]
            if !plCustId.isEmpty {
                params["plCustId"] = plCustId
            }
            break
        case .helpDesk:
            break
        case .getHelpDeskDetails(terminalID: let terminalID):
            params = ["terminalID":terminalID]
            break
        case .paymentModeGraphViewAll(tidList: let tidList, startDate: let startDate, endDate: let endDate):
            params = ["tidList": tidList, "startDate": startDate,"endDate": endDate]
            break
        case .performanceViewAllWithDateRange(tidList: let tidList, startDate: let startDate, endDate: let endDate):
            params = ["tidList": tidList, "startDate": startDate,"endDate": endDate]
            break
        case .performanceViewAllWithServiceType(tidList: let tidList, serviceType: let serviceType):
            params = ["tidList": tidList, "serviceType": serviceType]
            break
        case .miniStateMent(tidList: let tidList, type: let type, txnType: let txnType, serviceType: let serviceType, count: let count, startDate: let startDate, endDate: let endDate):
            
            params = ["tidList":tidList,"type":type,"txnsType":txnType,"startDate":startDate,"endDate":endDate, "count":count, "serviceType": serviceType]
            break
        case .merchantTxnDetail(tidList: let tidList, type: let type, txnType: let txnType, paymentType: let paymentType, startDate: let startDate, endDate: let endDate):
            params = ["tidList":tidList,"type":type,"txnsType":txnType,"startDate":startDate,"endDate":endDate]
            if !(paymentType?.isEmpty ?? true) {
                params["paymentType"] = paymentType
            }
            //{"tidList":["98777223","98777222","73000020","98202012","9820181246","98202011","98777221","98777230"],"type":"terminal","txnsType":["SaleSuccess"],"startDate":"2023-04-26","endDate":"2023-04-26","paymentType":["Cards","Cash","SMS Pay","BharatQR","UPI"]}
            break
        case .getFeedback(tidList: let tidList, startDate: let startDate, endDate: let endDate):
            params = ["tidList": tidList, "startDate": startDate,"endDate": endDate]
            break
        case .paymentModeSummary(tidList: let tidList, startDate: let startDate, endDate: let endDate):
            params = ["tidList": tidList, "startDate": startDate,"endDate": endDate]
            break
        case .getFeedbackDetails(tidList: let tidList, startDate: let startDate, endDate: let endDate):
            params = ["tidList": tidList, "startDate": startDate,"endDate": endDate]
        case .getComments(tidList: let tidList, startDate: let startDate, endDate: let endDate):
            params = ["tidList": tidList, "startDate": startDate,"endDate": endDate]
            
        case .resendReceipt(mtxnid: let mtxnid, msisdn: let msisdn):
            params = ["mtxnid": mtxnid]
            if !msisdn.isEmpty {
                params["msisdn"] = msisdn
            }
        case .mobNumberViewAll(tidList: let tidList, startDate: let startDate, endDate: let endDate):
            params = ["tidList": tidList, "startDate": startDate,"endDate": endDate]
            
        case .getStoreRatingData(tidList: let tidList, startDate: let startDate, endDate: let endDate):
            params = ["tidList": tidList, "startDate": startDate,"endDate": endDate]
            break
        case .getStoreFeedbackComments(tidList: let tidList, startDate: let startDate, endDate: let endDate):
            params = ["tidList": tidList, "startDate": startDate,"endDate": endDate]
            break
            
        case .getPayLaterFunnel360(tidList: let tidList, startDate: let startDate, endDate: let endDate):
            
            params = ["tidList": tidList, "startDate": startDate,"endDate": endDate]
            
        case .getPayLaterFunnelMMP(tidList: let tidList, startDate: let startDate, endDate: let endDate):
            
            params = ["tidList": tidList, "startDate": startDate,"endDate": endDate]
            
        case .getPayLaterViewAll(tidList: let tidList, type: let type):
            
            params = ["tidList" : tidList, "type" : type]
            
        case .getPayLaterCardDetail(tidList: let tidList, type: let type, since: let since):
            
            params = ["tidList" : tidList, "type" : type, "since" : since]
            
        case .getTxnDetailsMMP(tidList: let tidList):
            
            params = ["tidList" : tidList]
            
        case .getTxnDetails360(tidList: let tidList):
            
            params = ["tidList" : tidList]
            
        case .getPLFunnelViewAllDetailsMMP(tidList: let tidList):
            
            params = ["tidList" : tidList]
            
        case .getIndividualPlTxns(tidList: let tidList, since: let since):
            
            params = ["tidList" : tidList]
            if !since.isEmpty {
                params["since"] = since
            }
            
        case .getPLCustDetails360(tidList: let tidList, custId: let custId):
            
            params = ["tidList" : tidList, "custId" : custId]
            
        case .getPLCustDetailsMMP(tidList: let tidList, custIdGetPLTxns: let custIdGetPLTxns):
            
            params = ["tidList" : tidList, "custIdGetPLTxns" : custIdGetPLTxns]
            
        case .getTransactionReport(tidList: let tidList, startDate: let startDate, endDate: let endDate, sendEmail: let sendEmail):
            params = ["tidList": tidList, "startDate": startDate,"endDate": endDate, "sendEmail": sendEmail]
//        case .generateTransactionReport(tidList: let tidList, startDate: let startDate, endDate: let endDate, sendEmail: let sendEmail, startHour: let startHour, endHour: let endHour, paymentType: let paymentType, transactionStates: let transactionStates):
//            params = ["tidList": tidList, "startDate": startDate,"endDate": endDate, "sendEmail": sendEmail, "startHour":startHour, "endHour":endHour]
//            if paymentType.count > 0 {
//                params["paymentType"] = paymentType
//            }
//
//            if transactionStates.count > 0 {
//                params["transactionStates"] = transactionStates
//            }
        case .loyalty(mobile: let mobile, terminalId: let terminalId):
            params = ["mobile": mobile, "terminalId": terminalId]
        case .getCustomer(customerMobile: let customerMobile, tid: let tid):
            params = ["customerMobile": customerMobile, "tid": tid]
            
        case .addPayLaterTxn(customerMobile: let customerMobile, tid: let tid, amount: let amount, address: let address, name: let name, description: let description, pgId: let pgId, isNew: let isNew):
            params = ["customerMobile":customerMobile,"tid":tid,"amount":amount,"address":address,"name":name,"description":description,"pgId":pgId,"isNew":isNew]
        case .getBadges(tidList: let tidList):
            params = ["tidList": tidList]
        case .bannerList: break
        case .mdrCharges: break
        case .businessCategory(location: let location):
            params = ["location": location]
        case .plDayDetail(tidList: let tidList, startDate: let startDate, endDate: let endDate, type: let type):
            params = ["tidList": tidList, "startDate": startDate, "endDate": endDate,"type": type]
        case .v2pTxnList(phoneNumber: let phoneNumber):
            params = ["PhoneNumber": phoneNumber]
        case .loanBlocks: break
        case .loanEligibility(amountID: let amountID, tenureID: let tenureID):
            params = ["amountBlockId":amountID, "tenureBlockId":tenureID]
        case .LeaderBoard(tidList: let tidList, startDate: let startDate, endDate: let endDate):
            params = ["tidList": tidList, "startDate": startDate,"endDate": endDate]
        case .ProductEnquiry(tid: let tid, cardNumber: let cardNumber, customerMsisdn: let customerMsisdn, prodType: let prodType, appRefId: let appRefId, txnid: let txnid):
            params = ["tid":tid, "cardNumber":cardNumber, "customerMsisdn":customerMsisdn, "prodType":prodType, "appRefId":appRefId, "txnid":txnid]
        case .orderTrackList(tidList: let tidList):
            params = ["tids": tidList]
        case .VeriFyOTP(tid: let tid, otp: let otp, customerMsisdn: let customerMsisdn, prodType: let prodType, appRefId: let appRefId):
            params = ["tid":tid, "otp":otp, "customerMsisdn":customerMsisdn, "prodType":prodType, "appRefId":appRefId]
        case .creditToBankCardList(tidList: let tidList, startDate: let startDate, endDate: let endDate):
            params = ["terminalIdList": tidList, "startDate": startDate, "endDate": endDate]
        case .signUp(loginId: let loginId, deviceId: let deviceId, appVersion: let appVersion):
            params = ["mobileNumber": loginId, "deviceId": deviceId, "appVersion": appVersion, "devicePlatform": "ios"]
        case .pinCodeMapper(pinCode: let pinCode):
            params = ["pincode": pinCode]
        case .etbDOB(mobileNumber: let mobileNumber, dob: let dob):
            params = ["mobileNumber": mobileNumber, "dob": dob]
        case .etbOtpVerify(applicationId: let applicationId, otp: let otp):
            params = ["applicationId": applicationId, "otp": otp]
        case .etbResendOTP(etbApplicationId: let etbApplicationId, mobileNumber: let mobileNumber):
            params = ["etbApplicationId": etbApplicationId, "mobileNumber": mobileNumber]
        case .etbSetAuth(loginId: let loginId, mPin: let mPin, authType: let authType, isTouchIDEnabled: let isTouchIDEnabled, isFaceIDEnabled: let isFaceIDEnabled, fcmToken: let fcmToken):
            params = ["loginId": loginId, "mPin": mPin, "authType": authType, "isTouchIDEnabled": isTouchIDEnabled, "isFaceIDEnabled": isFaceIDEnabled, "fcmToken": fcmToken]
        case .accountSelection(accountNumber: let accountNumber, mcc: let mcc, annualTurnOver: let annualTurnOver, lgCode: let lgCode, lcCode: let lcCode, applicationId: let applicationId, emailId: let emailId, vpa: let vpa, address1: let address1, address2: let address2, address3: let address3, let landmark, addressType: let addressType, pinCode: let pinCode, city: let city, state: let state, gstn: let gstn, shopName: let shopName):
            params = ["accountNumber": accountNumber, "mcc": mcc, "annualTurnOver": annualTurnOver, "lgCode": lgCode, "lcCode": lcCode, "applicationId": applicationId, "emailId": emailId, "address1": address1, "address2": address2, "address3": address3, "addressType": addressType, "pinCode": pinCode, "city": city, "state": state, "gstn": gstn, "shopName": shopName]
            if vpa != ""{
                params["vpa"] = vpa
            }
        case .gstncheck(gstnNumber: let gstnNumber, applicationId: let applicationId):
            params = ["gstnNumber": gstnNumber, "applicationId": applicationId]
        case .capturemerchantconsent(agreementTime: let agreementTime, isagree: let isagree, loginId: let loginId, metadata: let metadata, module: let module):
            params = ["agreementTime": agreementTime, "isagree": isagree, "loginId": loginId, "metadata": metadata, "module": module]
        case .etbTermsAndCondition(module: let module):
            params = ["module": module]
        case .appliactionList(mobileNumber: let mobileNumber):
            params = ["mobileNumber": mobileNumber]
        case .eligibilityCheck(mobileNumber: let mobileNumber, applicationId: let applicationId):
            params = ["mobileNumber": mobileNumber, "applicationId": applicationId]
        case .upiCheck(vpa: let vpa, terminalId: let terminalId):
            params = ["vpa": vpa, "terminalId": terminalId]
        case .campaignList(tidList: let tidList, campaignId: let campaignId):
            params = ["tidList": tidList, "campaignId": campaignId]
        case .apnTxnDetail(txnid: let txnid):
            params = ["txnid": txnid]
        case .etbPanDetails(mobileNumber: let mobileNumber, identifierName: let identifierName, identifierValue: let identifierValue, pepFlag: let pepFlag, lgCode: let lgCode, lcCode: let lcCode):
            params = ["mobileNumber": mobileNumber, "identifierName": identifierName, "identifierValue": identifierValue, "pepFlag": pepFlag, "lgCode": lgCode, "lcCode": lcCode]
        case .logout: break
        case .checkHistory(tidList: let tidList, startDate: let startDate, endDate: let endDate):
            params = ["terminalIds": tidList, "startDate": startDate, "endDate": endDate]
        case .campaignEventList: break
            
        case .campaignTxnCountList(tidList: let tidList):
            params = ["tidList": tidList]
        case .checkElegibleTid(terminals: let terminals):
            params = ["terminalList": terminals]
        case .getSettlementReport(tidList: let tidList, startDate: let startDate, endDate: let endDate, sendEmail: let sendEmail):
            params = ["tidList": tidList, "startDate": startDate,"endDate": endDate, "sendEmail": sendEmail]
//        case .generateSettlementReport(tidList: let tidList, startDate: let startDate, endDate: let endDate, sendEmail: let sendEmail, startHour: let startHour, endHour: let endHour):
//            params = ["tidList": tidList, "startDate": startDate,"endDate": endDate, "sendEmail": sendEmail, "startHour":startHour, "endHour":endHour]
        case .switchTids(valueList: let valueList):
            params = ["":valueList]
        case .getCampaignResult(campaignId: let campaignId):
            params = ["campaignId": campaignId]
        case .plFunnelDetail(tidList: let tidList, since: let since):
            params = ["tidList" : tidList, "since" : since]
        case .panAccountDetails(loginId: let loginId, lastSixDigitAccountNo: let lastSixDigitAccountNo):
            params = ["loginId" : loginId, "lastSixDigitAccountNo" : lastSixDigitAccountNo]
        case .macSaveCampaignDetails(id: let id,campaignType: let campaignType, campaignStatus: let campaignStatus, heading: let heading, subHeading: let subHeading, campaignName: let campaignName, description: let description, otherDetails: let otherDetails, campaignFormat: let campaignFormat, caption: let caption, campaignTemplateType: let campaignTemplateType, scheduledDate: let scheduledDate, campaignMetaDetails: let campaignMetaDetails, backgroundImage: let backgroundImage, foregroundImage: let foregroundImage):
            params = ["id" : id,"campaignType": campaignType, "campaignStatus": campaignStatus, "heading":  heading, "subHeading": subHeading, "campaignName": campaignName, "description": description, "otherDetails": otherDetails, "campaignFormat": campaignFormat, "caption": caption, "campaignTemplateType": campaignTemplateType, "scheduledDate": scheduledDate, "campaignMetaDetails": campaignMetaDetails, "backgroundImage": backgroundImage, "foregroundImage": foregroundImage]
            
        case .macGetCampaignInfo(campaignType: let campaignType, campaignTemplateType: let campaignTemplateType,status: let status,search: let search,pageNo: let pageNo, pageSize: let pageSize):
            params = ["campaignType": campaignType,"campaignTemplateType": campaignTemplateType,"status" : status,"search": search,"pageNumber": pageNo,"pageSize" : pageSize]
        case .macGetImages(fileType: let fileType, terminalId: let terminalId):
            params = ["fileType": fileType,"terminalId": terminalId]
            
        case .macUploadBase64Image(imageFileData: let imageFileData, fileType: let fileType, fileName: let fileName):
            params = ["imageFileData" : imageFileData,"fileType" : fileType,"fileName" : fileName]
        case .macTermsAndConditions(module: let module):
            params = ["module" : module]
        case .macCaptureMerchantConsent(isagree: let isAgree, agreementTime: let agreementTime, metadata: let metaData, module: let module, tids: let tids):
            params = ["isagree":isAgree,"agreementTime":agreementTime,"metadata":metaData,"module":module,"tids":tids]
        case .macCountByStatus:
            break
        case .oarCreateOffer(id: let id,offerConfiguration: let offerConfiguration, banner: let banner, terminalId: let terminalId, offerName: let offerName, offerDescription: let offerDescription, offerStartDate: let offerStartDate, offerEndDate: let offerEndDate, offerStatus: let offerStatus):
            params = ["id" : id,"offerConfiguration":offerConfiguration,"banner":banner,"terminalId":terminalId,"offerName":offerName,"offerDescription":offerDescription,"offerStartDate":offerStartDate,"offerEndDate":offerEndDate, "offerStatus" : offerStatus]
        case .oarGetBannerTemplate:
            break
        case .oarGetBannerImages(fileType:let fileType,terminalId:let terminalId):
            params = ["fileType":fileType,"terminalId":terminalId]
        case .oarDashboardInfo(lowerTimeLimit: let lowerTimeLimit, upperTimeLimit: let upperTimeLimit):
            params = ["lowerTimeLimit":lowerTimeLimit,"upperTimeLimit":upperTimeLimit]
        case .oarGetAggregationData(fromDate: let fromDate, toDate: let toDate):
            params = ["fromDate":fromDate,"toDate":toDate]
        case .oarUploadBase64Image(imageFileData: let imageFileData, fileType: let fileType, fileName: let fileName):
            params = ["imageFileData" : imageFileData,"fileType" : fileType,"fileName" : fileName]
        case .oarSaveBannerDetails(bannerType: let bannerType, bannerMetaDetails: let bannerMetaDetails, bannerFrame: let bannerFrame, bannerImage: let bannerImage):
            params = ["bannerType":bannerType,"bannerMetaDetails":bannerMetaDetails,"bannerFrame":bannerFrame,"bannerImage":bannerImage]
        case .oarGetAggregationOfferIdData(fromDate: let fromDate, toDate: let toDate, offerId: let offerId):
            params = ["offerId":offerId]
            if fromDate != "" {
                params["fromDate"] = fromDate
            }
            if toDate != "" {
                params["toDate"] = toDate
            }
        case .oarGetOfferByTimePeriod(lowerTime: let lowerTime, upperTime: let upperTime):
            params = ["lowerTime":lowerTime,"upperTime":upperTime]
        case .oarGetAllOfferResult(sortBy: let sortBy, offerStatus: let offerStatus, pageNo: let pageNo, pageSize: let pageSize, lowerDate: let lowerDate, upperDate: let upperDate, rewardType: let rewardType, paymentModes: let paymentModes, terminalIds: let terminalIds, searchQuery: let searchQuery):
            params = ["offerStatus":offerStatus,"pageNo":pageNo,"pageSize":pageSize]
            if lowerDate != "" && upperDate != "" {
                params["dateFilter"] = ["lowerDate":lowerDate,"upperDate":upperDate]
            }
            if searchQuery != "" {
                params["searchQuery"] = searchQuery
            }
            if sortBy != "" {
                params["sortBy"] = sortBy
            }
            if rewardType.count > 0 {
                params["rewardType"] = rewardType
            }
            if paymentModes.count > 0 {
                params["paymentModes"] = paymentModes
            }
            if terminalIds.count > 0 {
                params["terminalIds"] = terminalIds
            }
        case .oarTermsAndConditions(module: let module):
            params = ["module" : module]
        case .oarCaptureMerchantConsent(isagree: let isAgree, agreementTime: let agreementTime, metadata: let metaData, module: let module, tids: let tids):
            params = ["isagree":isAgree,"agreementTime":agreementTime,"metadata":metaData,"module":module,"tids":tids]
        case .oarCheckEligibility(terminalId:let terminalId ,allTerminalId: let allTerminalId,rewardCriteria:let rewardCriteria,qualifyingPeriod:let qualifyingPeriod):
            params = ["terminalId":terminalId,"allTerminalId":allTerminalId,"rewardCriteria":rewardCriteria,"qualifyingPeriod":qualifyingPeriod]
        case .oarGetRedemptionsForTerminals(offerId: let offerId, terminalId: let terminalId):
            params = ["id":offerId,"terminalId":terminalId]
        case .oarGetOfferById(offerId: let offerId):
            params = ["id":offerId]
        case .getOfferCountByStatus(offerStatus: let offerStatus):
            params = ["offerStatus":[offerStatus]]
        case .oarPaymentDashboardBannerInfo(terminalIds: let terminalIds):
            params = ["terminalIds" : terminalIds]
        case .oarCustomOfferBannerInfo(mobile: let mobile, tID: let tID, amount: let amount, mode: let mode):
            params = ["mobileNumber":mobile,
                      "txnAmount": amount,
                      "paymentMode": mode,
                      "terminalId": tID]
        case .oarCustomOfferBannerInfoV1(mobile: let mobile, tID: let tID, amount: let amount):
            params = ["mobileNumber":mobile,
                      "txnAmount": amount,
                      "terminalIdList": tID]
        case .oarAddOfferRedeem(offerId: let offerId, terminalId: let terminalId, customerId: let customerId, offerAmount: let offerAmount, transactionAmount: let transactionAmount, transactionStatus: let transactionStatus, paymentMode: let paymentMode) :
            params = [
                "offerId" : offerId,
                    "terminalId" : terminalId,
                    "offerAmount" : offerAmount,
                    "transactionAmount" : transactionAmount,
                    "transactionStatus" : transactionStatus,
                    "paymentMode" : paymentMode
            ]
            if !customerId.isEmpty {
                params["customerId"] = customerId
            }
        case .etbValidateQR(upi: let upi):
            params = ["upiLink": upi]
        case .oarOfferRedemptionData(redemptionId: let redemptionId):
            if redemptionId.count > 0 {
                params = ["redemptionList" : [redemptionId]]
            }
            else {
                params = ["redemptionList" : []]
            }
            
        case .v2pTermsAndCondition(module: let module):
            params = ["module": module]
        case .v2pCaptureMerchantConsent(isagree: let isagree, agreementTime: let agreementTime, metadata: let metadata, module: let module, tids: let tids):
            params = ["agreementTime": agreementTime, "isagree": isagree, "tids": tids, "metadata": metadata, "module": module]
        case .vendorPayDetails(terminalId: let terminalId):
            params = ["terminalId" : terminalId]
        case .qrDetailsList:
            break
        case .qrDetailsWaiting(terminalId: let terminalId):
            params = ["terminalId": terminalId]
        case .activateQR(tid: let tid, vpa: let vpa, rmCode: let rmCode):
            params = ["tid": tid, "vpa": vpa, "rmCode": rmCode]
        case .generateTransactionReport(tidList: let tidList, startDate: let startDate, endDate: let endDate, sendEmail: let sendEmail):
            params = ["tidList": tidList, "startDate": startDate,"endDate": endDate, "sendEmail": sendEmail]
            break
        case .generateSettlementReport(tidList: let tidList, startDate: let startDate, endDate: let endDate, sendEmail: let sendEmail):
            params = ["tidList": tidList, "startDate": startDate,"endDate": endDate, "sendEmail": sendEmail]
            break
        case .generateCustomTransactionReport(tidList: let tidList, startDate: let startDate, endDate: let endDate, startHour: let startHour, endHour: let endHour, paymentType: let paymentType, transactionStates: let transactionStates, sendEmail: let sendEmail):
            params = ["tidList": tidList, "startDate": startDate,"endDate": endDate, "startHour": startHour, "endHour": endHour, "sendEmail": sendEmail]
            if paymentType.count > 0 {
                params["paymentType"] = paymentType
            }
            if transactionStates.count > 0 {
                params["transactionStates"] = transactionStates
            }

            break
        case .generateCustomSettlementReport(tidList: let tidList, startDate: let startDate, endDate: let endDate, startHour: let startHour, endHour: let endHour, paymentType: let paymentType, transactionStates: let transactionStates, sendEmail: let sendEmail):
            params = ["tidList": tidList, "startDate": startDate,"endDate": endDate, "startHour": startHour, "endHour": endHour, "sendEmail": sendEmail]
            if paymentType.count > 0 {
                params["paymentType"] = paymentType
            }
            if transactionStates.count > 0 {
                params["transactionStates"] = transactionStates
            }

            break

        case .bankProductHistory(terminalIds: let terminalIds,endDate: let endDate,startDate: let startDate,productName: let productName):
            params = ["terminalIds" : terminalIds, "endDate" : endDate, "startDate" : startDate, "productName" : productName]
        case .bankProductEligibility(terminalIds: let terminalIds,productName: let productName):
            params = ["terminalIds" : terminalIds, "productName" : productName]
        case .emiListProduct : break
        case .activateDeactivateTids(terminalIds: let terminalIds,productName: let productName, status: let status,reason: let reason) :
            params = ["terminalIds" : terminalIds, "productName" : productName, "status" : status, "reason":reason ]
        case .getUserTerminalInfo: break
        case .getMapper(terminalId: let terminalId):
            params = ["terminalId": terminalId]
        case .emiVerifyOtp(productName: let productName, requestId: let requestId, otp: let otp):
            params = ["productName" : productName, "requestId" : requestId, "otp" : otp]
        case .getSettlementData(terminalIdList: let terminalIdList, startDate: let startDate, endDate: let endDate):
            params = ["terminalIdList": terminalIdList, "startDate": startDate,"endDate": endDate]
        case .getByMobileNumber(mobileNumber: let mobileNumber):
            params = ["mobileNumber" : mobileNumber]
        case .addCustomer(mobileNumber: let mobileNumber):
            params = ["mobileNumber" : mobileNumber]
        case .getActiveMapper(mapperId: let mapperId, cid: let cid):
            params = ["mapperId": mapperId, "cid": cid]
        case .updateMapperData(mapperData: let mapperData):
            params = mapperData
        case .preApprovedEMI(customerId: let customerId,terminalId: let terminalId):
            params = ["customerId" : customerId, "terminalId" : terminalId]
        case .emiPlans(transactionAmount: let transactionAmount):
            params = ["transactionAmount" : transactionAmount]
        case .memberAttributeFetch(memberType: let memberType, memberValues: let memberValues):
            params = ["memberType": memberType, "memberValues": memberValues]
        case .emiInitiateTransaction(customerId: let customerId,terminalId: let terminalId,transactionAmount: let transactionAmount,redemptionIds: let redemptionIds):
            params = ["customerId" : customerId, "terminalId" : terminalId, "transactionAmount" : transactionAmount, "redemptionIds" : redemptionIds]
        case .emiCheckEligibility(brandName: let brandName ,emi: let emi,emiTransactionId: let emiTransactionId,interestAmount: let interestAmount,interestRate:let interestRate,paymentCredential: let paymentCredential,paymentCredentialType:let paymentCredentialType,processingFee: let processingFee,productType: let productType,tenure: let tenure,tenureType: let tenureType,transactionAmount: let transactionAmount,insuranceCharges: let insuranceCharges,otherCharges: let otherCharges,paymentFrequency: let paymentFrequency,noOfInstallment:let noOfInstallment,customerConsent:let customerConsent,customerConsentTime: let customerConsentTime):
            params = ["brandName": brandName ,"emi": emi,"emiTransactionId": emiTransactionId,"interestAmount":interestAmount,"interestRate": interestRate,"paymentCredential": paymentCredential,"paymentCredentialType": paymentCredentialType,"processingFee": processingFee,"productType": productType,"tenure": tenure,"tenureType":tenureType,"transactionAmount":transactionAmount, "insuranceCharges":insuranceCharges,"otherCharges":otherCharges,"paymentFrequency":paymentFrequency,"noOfInstallment":noOfInstallment,"customerConsent" :customerConsent,"customerConsentTime":customerConsentTime]
        case .emiPaymentVerifyOtp(emiTransactionId: let emiTransactionId,otp: let otp):
            params = ["emiTransactionId": emiTransactionId,"otp": otp]
        case .emiGenerateCustomerUrl(customerId: let customerId,terminalId: let terminalId,transactionAmount: let transactionAmount):
            params = ["customerId" : customerId, "terminalId" : terminalId, "transactionAmount" : transactionAmount]
        case .bankEMIResendOTP(requestId: let requestId):
            params = ["requestId" : requestId]

        case .loanCategoryDetails: break
        case .getMidSegments: break
        case .activationRequest(terminalIds: let terminalIds, productType: let productType, requestedBy: let requestedBy):
            params = ["terminalIds": terminalIds,"productType": productType,"requestedBy": requestedBy]
            break
        case .checkAus(cidIds: let cidIds):
            params = ["corporateIds": cidIds]
            
        case .reportingResults(reportName: let reportName, request: let request, fileType: let fileType, sendEmail: let sendEmail):
            params = ["reportName": reportName,"request": request,"fileType": fileType,"sendEmail": sendEmail]
        case .reportingResultsMultiple(reportList: let reportList, fileType: let fileType, sendEmail: let sendEmail,rConfig: let rConfig):
            params = ["reportList": reportList,"fileType": fileType, "sendEmail":sendEmail, "reportConfig": rConfig]
            
        case .checkFileStatus(requestId: let requestId):
            params = ["requestId":requestId]
            break
        case .sendEmail(requestId: let requestId):
            params = ["requestId":requestId]
            break
        case .getPreferencesSMSNotificationList(terminalList: let terminalList):
            params = ["":terminalList]
        case .getPreferencesSMSNotificationHistory(pageNo: let pageNo, pageSize: let pageSize, terminalList: let terminalList):
            params = ["pageNo": pageNo, "pageSize": pageSize, "request": terminalList]
        case .getPreferencesSMSNotificationUpdateList(terminalList: let terminalList):
            params = ["":terminalList]
        case .onboardVyaparify(terminalId : let terminalId):
            params = ["terminalId": terminalId]
            break
        case .getRedirectionDetails(terminalId : let terminalId):
            params = ["terminalId": terminalId]
            break
        case .getPosHistory(terminalIds: let terminalIds):
            params = ["terminalIds": terminalIds]
            break
        case .getPosToken(terminalIds: let terminalIds):
            params = ["terminalIds": terminalIds]
        case .getPosDeviceDetails(terminalId: let terminalId):
            params = ["terminalId": terminalId]
            break
        case .getPosDefaultMdrRate(terminalId: let terminalId):
            params = ["terminalId": terminalId]
            break
        case .posEmail(applicationId: let applicationId):
            params = ["applicationId": applicationId]
            break
        case .posDownload(applicationId: let applicationId):
            params = ["applicationId": applicationId]
            break

        case .linkedDevices(members: let members, memberType: let memberType):
            params = ["members": members, "memberType": memberType]
            break
        case .requestOTP(imei: let imei, members: let members, memberType: let memberType):
            params = ["imei": imei,"members": members, "memberType": memberType]

            break
        case .registerDevice(imei: let imei, deviceID: let deviceID, otp: let otp, clientType: let clientType, action: let action, members: let members,memberType: let memberType):
            if otp != nil{
                params = ["imei": imei,"deviceID": deviceID, "otp": otp ?? "","clientType":clientType,"action":action]
            }else{
                params = ["imei": imei,"deviceID": deviceID,"clientType":clientType,"action":action,"members":members ?? [],"memberType":memberType ?? ""]
            }

            break
        case .deviceSetting(language: let language, imei: let imei, deviceID: let deviceID):
            params = ["imei": imei,"deviceID": deviceID, "language": language]

            break
        case .actions(imei: let imei, action: let action):
            params = ["imei": imei, "action": action]
            break
        case .deviceLang:
            break
        case .tidDetails(terminalId: let terminalId):
            params = ["terminalId": terminalId]
            break
        case .diagnostics(terminalId: let terminalId):
            params = ["terminalId": terminalId]
            break
        case .ampGenerateToken:
            break
        case .v2TnCContent(module: let module):
            params = ["module": module]
            break
        case .getConsent(module: let module, loginId: let loginId):
            params = ["module": module, "loginId" : loginId]
            break
        case .soundboxStatus(terminalIds: let terminalIds):
            params = ["terminalIds" : terminalIds]
            break
        case .getTemplates:
            break
        case .createTicket(terminalId: let terminalId, templateId: let templateId, ticketValues: let ticketValues):
            params = ["terminalId": terminalId, "templateId": templateId, "ticketFieldValues" : ticketValues]
        case .getDashboardData(terminals: let terminals):
            params = ["terminals": terminals]
        case .getDeviceType(terminals: let terminals):
            params = ["terminalIds": terminals]
        case .panToGst(terminalId: let terminalId):
            params = ["terminalId": terminalId]
        case .sendOtpService(contextName: let contextName, contextId: let contextId, purpose: let purpose, communicationType: let communicationType, communicationValue: let communicationValue):
            params = ["contextName": contextName, "contextId": contextId, "purpose": purpose, "communicationType": communicationType, "communicationValue": communicationValue]
        case .resendServiceOTP(requestId: let requestId):
            params = ["requestId": requestId]
        case .verifyServiceOTP(requestId: let requestId, otp: let otp):
            params = ["requestId": requestId, "otp": otp]
        case .addTidReportEmail(tid: let tid,reportEmail: let reportEmail,userMobile: let userMobile):
            params = ["tids" : tid,"reportEmail":reportEmail,"userMobile":userMobile]
        case .getReportEmail(tids: let tids,userMobile: let userMobile):
            params = ["tids" : tids,"userMobile": userMobile ?? ""]
        case .editReportEmail(tid: let tid, reportEmail: let reportEmail,userMobile: let userMobile):
            params = ["tids" : tid,"reportEmail":reportEmail,"userMobile":userMobile]
        case .insuranceCyberProduct(terminalId: let terminalId):
            params = ["terminalId": terminalId]
        case .cyberKnowMorw(applicationId: let applicationId):
            params = ["applicationId": applicationId]
        case .insuranceSendOtp(contextName: let contextName, contextId: let contextId, purpose: let purpose, communicationType: let communicationType, communicationValue: let communicationValue, otherDetails: let otherDetails, otpChannel: _):
            params = ["contextName": contextName, "contextId": contextId, "purpose": purpose, "communicationType": communicationType, "communicationValue": communicationValue, "otherDetails":otherDetails, "templateName":"insurance"]
        case .insuranceResendOtp(requestId: let requestId, otpChannel: _):
            params = ["requestId": requestId, "templateName":"insurance"]
        case .insuranceVerifyOtp(requestId: let requestId, otp: let otp):
            params = ["requestId": requestId, "otp": otp]
        case .insurancePurchase(applicationId: let applicationId):
            params = ["applicationId": applicationId]
        case .insuranceDetails(terminalId: let terminalId):
            params = ["terminalId": terminalId]
        case .fetchPanToGstin(applicationId: let applicationId, state: let state, pincode: let pincode, accountNumber: let accountNumber):
            params = ["applicationId": applicationId, "state": state, "pincode": pincode, "accountNumber": accountNumber]
        case .validateCardTxnSession: break
        case .getSettlementSummaryData(terminalIdList: let terminalIdList, startDate: let startDate, endDate: let endDate, dateType: let dateType):
            params = ["terminalIdList": terminalIdList, "startDate": startDate, "endDate": endDate, "dateType": dateType]
        case .getSettlementDetails(terminalIds: let terminalIds, startDate: let startDate, endDate: let endDate, reqType: let reqType, dateType: let dateType):
            params = ["terminalIds": terminalIds, "startDate": startDate, "endDate": endDate, "reqType": reqType]
            if dateType.count > 0 {
                params["dateType"] = dateType
            }
        case .deactivatedReason(terminalIds: let terminalIds):
            params = ["terminalIds": terminalIds]
        case .getSettlementList(reqType: let reqType, transactions: let transactions):
            params = ["reqType": reqType, "transactions": transactions]
        case .getSettlementListSummary(terminalIdList: let terminalIdList, dateType: let dateType, startDate: let startDate, endDate: let endDate):
            params = ["terminalIdList": terminalIdList, "dateType": dateType, "startDate": startDate,"endDate": endDate]
        case .getTransactionSummaryData(txnid: let txnid):
            params = ["txnid": txnid]
        case .handleCardTxnData(amount: let amount, terminalId: let terminalId, description: let description, customerMobile: let customerMobile, providerId: let providerId, status: let status, approvalCode: let approvalCode, retrievalReferenceNumber: let retrievalReferenceNumber, transactionId: let transactionId):
            if status == "Initiated" {
                params = ["amount": amount, "terminalId": terminalId, "description": description, "customerMobile": customerMobile, "providerId": providerId, "status": status]
            } else {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let dateData = dateFormatter.string(from: Date())
                
                let timeFormatter = DateFormatter()
                timeFormatter.dateFormat = "HH:mm:ss"
                let timeData = timeFormatter.string(from: Date())
                
                params = ["transactionDate": dateData,
                          "transactionTime": timeData,
                          "terminalId": terminalId,
                          "authIdRefNo": "997477",
                          "bankMID": "M767778y7",
                          "amount": amount,
                          "providerId": providerId,
                          "transactionStatus": "Approved or completed successfully",
                          "businessName": "MintOak Test",
                          "billNum": transactionId,
                          "pinCode": "",
                          "transactionType": "SALE",
                          "cardType": "DC",
                          "txnid": transactionId,
                          "pgwTxnid": transactionId,
                          "status": status,
                          "appVersion": "1.0.0",
                          "stan": "000042",
                          "address": "",
                          "cardNumber": "XXXXXXXXXXXX6425",
                          "cardHolderName": "SURENDRA",
                          "tvr": "80C0048000",
                          "rrn": "-1107327005837876318",
                          "tsi": "6800",
                          "currencyId": "INR",
                          "responseCode": "00",
                          "approvalCode": approvalCode,
                          "cardNetwork": "VISA",
                          "transactionLat": "19.103075",
                          "transactionLong": "72.88628",
                          "transactionMode": "CHIP",
                          "batchNumber": "000002",
                          "responseMessage": "Transaction Approved.",
                          "accquirerName": "HDFC",
                          "applicationId": "A0000000031010",
                          "appLabel": "5649534120435245444954",
                          "invoiceNumber": "000038",
                          "customerMobile": "9889899898"]
            }
        }
        return params
    }
    
    var headers: [String : String]? {
        var headers: [String : String] = [:]
//        NetWorker.deviceID = "a46be034b6f1a8f5"//"84867C8E-612F-4762-B4E9-AB696B98B914"
        switch self {
            
        case .validateUser:
            if NetWorker.sessionID == ""{
                headers = ["deviceID" : NetWorker.deviceID, "Content-Type" : "application/json", "User-Agent": getUserAgent(), "Cache-Control" : "no-store"]
            }else{
                headers = ["sessionID" : NetWorker.sessionID ?? "", "deviceID" : NetWorker.deviceID, "Content-Type" : "application/json", "User-Agent": getUserAgent(), "Cache-Control" : "no-store"]
            }
            
        default:
            
            headers = ["sessionID" : NetWorker.sessionID ?? "", "deviceID" : NetWorker.deviceID, "Content-Type" : "application/json", "User-Agent": getUserAgent(), "Cache-Control" : "no-store"]
            
        }
        
        return headers
    }
    
    func getUserAgent() -> String{
        let dictionary = Bundle.main.infoDictionary!
        let version = dictionary["CFBundleShortVersionString"] as! String
        
        let build = dictionary["CFBundleVersion"] as! String
        let appName = dictionary["CFBundleName"] as! String
        let modelName = UIDevice.current.model
        let platform = UIDevice.current.systemName
        let operationSystemVersion = ProcessInfo.processInfo.operatingSystemVersionString
        var systemInfo = utsname()
          uname(&systemInfo)
          let machineMirror = Mirror(reflecting: systemInfo.release)
          let darvinVersionString = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8,
              value != 0 else {
                return identifier
            }
            return identifier + String(UnicodeScalar(UInt8(value)))
          }
        let str = "\(appName)/\(version)(\(platform);\(modelName);\(operationSystemVersion)) CFNetwork/\(build) Darvin/\(darvinVersionString)"
        return str
    }
    
}
