//
//  Date+Ext.swift
//  GitHubFollowers
//
//  Created by Maciej Michalik on 22/02/2023.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E d MMMM yyyy"
        return dateFormatter.string(from: self)
    }
}
