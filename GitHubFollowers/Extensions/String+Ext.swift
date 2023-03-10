//
//  String+Ext.swift
//  GitHubFollowers
//
//  Created by Maciej Michalik on 22/02/2023.
//

import Foundation

extension String {
    
    func converteToDate() -> Date? {
       
        let dateFormatter           = DateFormatter()
        dateFormatter.dateFormat    = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale        = Locale(identifier: "pl_PL")
        dateFormatter.timeZone      = .current
        
        return dateFormatter.date(from: self)
    }
    
    func convertToDisplayFormat() -> String {
        guard let date = self.converteToDate() else { return "N/A"}
        return date.convertToMonthYearFormat()
    }
    
}
