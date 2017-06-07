//
//  Sharing.swift
//  Sudoku
//
//  Created by Dev on 22/02/16.
//  Copyright © 2016 LA. All rights reserved.
//


import UIKit

public struct Sharing {
    
    public init() {}
    
    public func publish (_ pvc : UIViewController, vc : UIViewController, url: String, isKids: Bool) {
        if isKids {
            askParens(pvc, vc: vc, url: url)
        } else {
            publish(vc, url: url)
        }
    }
    
    private func publish (_ vc : UIViewController, url: String, img: UIImage? = nil)
    {
        let textToShare = NSLocalizedString("sharingText", comment: "sharingText")
        if let myWebsite = URL(string: url) {
            var objectsToShare = [textToShare, myWebsite] as [Any]
            if let image = img {
                objectsToShare.append(image)
            }
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            if UIDevice.current.userInterfaceIdiom == .pad {
                activityVC.popoverPresentationController!.sourceView = vc.view;
            }
            vc.present(activityVC, animated: true, completion: nil)
        }
    }
    
    private func askParens (_ pvc : UIViewController, vc : UIViewController, url: String)
    {
        let kidsView = KidsView.loadFromNib()
        kidsView.frame = pvc.view.frame
        kidsView.settingQuestion()
        pvc.view.addSubview(kidsView)
        kidsView.correctAnswerBlock = {
            self.publish(vc, url: url)
        }
    }
}
