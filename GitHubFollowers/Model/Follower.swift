//
//  Followers.swift
//  GitHubFollowers
//
//  Created by Maciej Michalik on 09/02/2023.
//

import Foundation

struct Follower: Codable, Hashable {
    var login: String
    var avatarUrl: String
}
