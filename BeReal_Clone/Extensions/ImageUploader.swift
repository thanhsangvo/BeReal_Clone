//
//  ImageUploader.swift
//  BeReal_Clone
//
//  Created by Dev Sang on 15/08/2023.
//

import SwiftUI
import Firebase
import FirebaseStorage

enum UploadType {
    case profile
    case post
    
    var filePath: StorageReference {
        let filename = NSUUID().uuidString
        switch self {
        case .profile:
            return Storage.storage().reference(withPath: "/profile_image/\(filename)")
        case .post:
            return Storage.storage().reference(withPath: "/post_images/\(filename)")
        }
        
    }
     
}

struct ImageUploader {
    
    static func uploadImage(image: UIImage, type: UploadType, completion: @escaping(String) -> Void) {
        
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let ref = type.filePath
        ref.putData(imageData) { _, err in
            if let err  = err {
                print(err.localizedDescription)
                return
            }
            
            ref.downloadURL { url, err in
                
                guard let url = url?.absoluteString else { return }
                completion(url)
            }
        }
        
    }
}

