//
//  RateMe.swift
//  Sudoku
//
//  Created by Dev on 22/02/16.
//  Copyright © 2016 LA. All rights reserved.
//

import UIKit

public struct OpenAppStore {
    
    public init() {}
    
    public func perforAction(_ vc : UIViewController , isKids: Bool, action: @escaping (() -> Swift.Void))
    {
        if isKids {
            let kidsView = KidsView.loadFromNib()
            kidsView.frame = vc.view.frame
            kidsView.settingQuestion()
            vc.view.addSubview(kidsView)
            kidsView.correctAnswerBlock = action
        } else {
            action()
        }
    }
    
    public func openApp(_ vc : UIViewController, link: String , isKids: Bool)
    {
        if isKids {
            askParens(vc, link: link)
        } else {
            openApp(link)
        }
    }
    
    private func openApp(_ link: String)
    {
        let path = URL(string: link)!
        UIApplication.shared.openURL(path)
    }
    
    private func askParens (_ vc : UIViewController, link: String)
    {
        let kidsView = KidsView.loadFromNib()
        kidsView.frame = vc.view.frame
        kidsView.settingQuestion()
        vc.view.addSubview(kidsView)
        kidsView.correctAnswerBlock = {
            self.openApp(link)
        }
    }
    
}
