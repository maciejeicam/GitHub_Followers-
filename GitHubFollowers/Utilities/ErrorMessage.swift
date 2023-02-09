//
//  ErrorMessage.swift
//  GitHubFollowers
//
//  Created by Maciej Michalik on 09/02/2023.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername   = "This username created an invalid request. PLease try again."
    case unableToComplete  = "Unable to complete your request. Please check your internet connection"
    case invalidResponse   = "Invalid response from the server. PLease try again."
    case invalidData       = "The data received from the server was invalid. Please try again."
}
