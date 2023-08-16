//
//  User.swift
//  BeReal_Clone
//
//  Created by Dev Sang on 14/08/2023.
//

import Firebase
import FirebaseFirestoreSwift

struct User: Codable {
    @DocumentID var id: String?
    var username : String?
    var profileImageUrl : String?
    var fullname : String
    var date : String?
    var bio : String?
    var location: String?
    var phone: String
    
    var isCurrentUser: Bool {
        return AuthenticationViewModel.shared.userSession?.uid == id
    }
    
}
