//
//  FeedCellViewModel.swift
//  BeReal_Clone
//
//  Created by Dev Sang on 16/08/2023.
//

import SwiftUI
import Firebase

class FeedCellViewModel: ObservableObject {
    @Published var beReal : BeReal
    
    init(beReal: BeReal) {
        self.beReal = beReal
    }
    
    func fetchBeRealUser()  {
        Firestore.firestore().collection("user").document(beReal.userId).getDocument { snap, err in
            if let err  = err {
                print(err.localizedDescription)
                return
            }
            
            self.beReal.user = try? snap?.data(as: User.self)
        }
    }
}
