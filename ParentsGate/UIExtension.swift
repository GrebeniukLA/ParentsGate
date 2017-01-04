//
//  UIExtension.swift
//  Sudoku
//
//  Created by Dev on 04/01/16.
//  Copyright © 2016 LA. All rights reserved.
//

import UIKit



protocol UIViewLoading {}
extension UIView : UIViewLoading {}

extension UIViewLoading where Self : UIView {
    
    // note that this method returns an instance of type `Self`, rather than UIView
  static func loadFromNib() -> Self {
    let nibName = "\(self)".characters.split{$0 == "."}.map(String.init).last!
    let resourcesBundle = Bundle(for:self)
    // NSBundle* resourcesBundle = [NSBundle bundleForClass:[ClassA class]];
    let nib = UINib(nibName: nibName, bundle: resourcesBundle)
    return nib.instantiate(withOwner: self, options: nil).first as! Self
  }
  
}


