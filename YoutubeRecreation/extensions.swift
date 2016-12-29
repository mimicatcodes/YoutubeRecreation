//
//  extensions.swift
//  YoutubeRecreation
//
//  Created by Luna An on 12/29/16.
//  Copyright © 2016 Mimicatcodes. All rights reserved.
//

import UIKit

extension UIView {
    
    func addConstraintsWithFormat(format: String, views: UIView...){
        
        var viewsDictionary = [String:UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: [], metrics: nil, views: viewsDictionary))
        
    }
}


extension UIColor {
    
    static func rgb(r:CGFloat, g:CGFloat, b:CGFloat) -> UIColor{
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
        
    }
}
