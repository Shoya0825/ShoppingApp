//
//  Validator.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/03/28.
//

import UIKit

class Validator {
    
    static let shared = Validator()
    
    enum EmailErrorType {
        case empty
        case wrongFormat
        case noError
        
        var resultMessage: String {
            switch self {
            case .empty: return "メールアドレスが未入力です"
            case .wrongFormat: return "受付できないメールアドレスです"
            case .noError: return ""
            }
        }
    }
    
    enum PasswordErrorType {
        case empty
        case shortCount
        case noError
        
        var resultMessage: String {
            switch self {
            case .empty: return "パスワードが未入力です"
            case .shortCount: return "半角英数字8文字以上で入力してください"
            case .noError: return ""
            }
        }
    }
    
    enum ConfirmPasswordErrorType {
        case empty
        case notSame
        case noError
        
        var resultMessage: String {
            switch self {
            case .empty: return "確認用パスワードが未入力です"
            case .notSame: return "パスワードが一致していません"
            case .noError: return ""
            }
        }
    }
    
    func emailValidationCheck(email: String) -> String {
        let errorType = EmailErrorType.self
        
        if email == "" {
            return errorType.empty.resultMessage
        }
        return errorType.noError.resultMessage
    }
    
    func emailFormatCheck(email: String) -> String {
        let errorType = EmailErrorType.self
        
        let mailAddressRegex = "[A-Z0-9a-z._+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", mailAddressRegex)
        
        
        var message = emailPredicate.evaluate(with: email) ? errorType.noError.resultMessage : errorType.wrongFormat.resultMessage
        
        return message
    }
    
    func passwordValidationCheck(password: String) -> String {
        let errorType = PasswordErrorType.self
        
        if password == "" {
            return errorType.empty.resultMessage
        } else if password.count < 8 {
            return errorType.shortCount.resultMessage
        }
        return errorType.noError.resultMessage
    }
    
    func confirmPasswordValidationCheck(password: String, confirmPassword: String) -> String {
        let errorType = ConfirmPasswordErrorType.self
        
        if confirmPassword == "" {
            return errorType.empty.resultMessage
        } else if confirmPassword != password {
            return errorType.notSame.resultMessage
        }
        return errorType.noError.resultMessage
    }
    
}
