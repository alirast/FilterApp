//
//  ImageSaver.swift
//  FilterApp
//
//  Created by N S on 08.08.2023.
//

import UIKit

class ImageSaver: NSObject {
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    func writeToAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }
    
    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("saving finished")
        if let error = error {
            errorHandler?(error)
        } else {
            successHandler?()
        }
    }
}
