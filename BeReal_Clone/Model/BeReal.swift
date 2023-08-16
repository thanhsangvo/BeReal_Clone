//
//  BeReal.swift
//  BeReal_Clone
//
//  Created by Dev Sang on 16/08/2023.
//

import SwiftUI

struct BeReal: Decodable {
    var username: String
    var frontImageUrl: String
    var backImagUrl : String
    var userId: String
    var user: User?
}
