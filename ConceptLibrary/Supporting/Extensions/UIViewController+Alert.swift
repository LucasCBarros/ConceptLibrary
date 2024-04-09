//
//  UIViewController+Alert.swift
//  ConceptLibrary
//
//  Created by Lucas C Barros on 2024-04-09.
//

import UIKit

extension UIViewController {
    func alert(title: String = "Alert", message: String = "Message", button: String = "Ok") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        //        alert.addImage(UIImage(named: "plants")!)
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: button, style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
            @unknown default:
                fatalError("unknow default alert error")
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

//extension UIAlertController {
//    func addImage(_ image: UIImage) {
//        let maxsize = CGSize(width: 245, height: 300)
//        let imageSize = image.size
//
//        let ratio = imageSize.width > imageSize.height
//        ? maxsize.width / imageSize.width
//        : maxsize.height / imageSize.height
//
//        let scaledSize = CGSize(width: imageSize.width * ratio, height: imageSize.height * ratio)
//
//        let resizedImage = image.imageWithSize(scaledSize)
//
//        let imageAction = UIAlertAction(title: "", style: .default)
//        imageAction.isEnabled = false
//        imageAction.setValue(resizedImage.withRenderingMode(.alwaysOriginal), forKey: "image")
//        self.addAction(imageAction)
//    }
//}
//
//extension UIImage {
//    func imageWithSize(_ size: CGSize) -> UIImage {
//        var scaledImageRect = CGRect.zero
//
//        let aspectWidth: CGFloat = size.width / self.size.width
//        let aspectHeight: CGFloat = size.height / self.size.height
//        let aspectRatio: CGFloat = min(aspectWidth, aspectHeight)
//
//        scaledImageRect.size.width = self.size.width * aspectRatio
//        scaledImageRect.size.height = self.size.height * aspectRatio
//        scaledImageRect.origin.x = (size.width - scaledImageRect.size.width) / 2.0
//        scaledImageRect.origin.y = (size.height - scaledImageRect.size.height) / 2.0
//
//        UIGraphicsBeginImageContextWithOptions(size, false, 0)
//
//        self.draw(in: scaledImageRect)
//
//        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//
//        return scaledImage ?? UIImage()
//    }
//}
