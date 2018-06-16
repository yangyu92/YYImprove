//
//  HCInputValidator.swift
//  RxXMLY
//
//  Created by sessionCh on 2017/12/29.
//  Copyright © 2017年 sessionCh. All rights reserved.
//

import UIKit

class HCInputValidator: NSObject {

    class func isValidEmail(email: String) -> Bool {
        
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        let isValid = predicate.evaluate(with: email)
        
        return isValid
    }
    
    class func isValidSearch(searchStr: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: "^\\S+@\\S+\\.\\S+$", options: .caseInsensitive)
            let result = regex.matches(in: searchStr,
                                       options: NSRegularExpression.MatchingOptions(rawValue: 0),
                                       range: NSRange.init(location: 0, length: searchStr.count))
            if result.count > 0 {
                return result.count > 0
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    
    class func isValidPhone(phone: String) -> Bool {
        
        let regex = "^1\\d{10}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        let isValid = predicate.evaluate(with: phone)
        
        return isValid
    }
    
    class func isvalidationAccount(account: String) -> Bool {
        return account.count >= 6
    }
    
    class func isvalidationPassword(password: String) -> Bool {
        return password.count >= 6
    }
}
