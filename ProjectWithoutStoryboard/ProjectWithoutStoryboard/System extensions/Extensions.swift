//
//  Extensions.swift
//  ProjectWithoutStoryboard
//
//  Created by Lebedev Petr on 27.10.2022.
//

import UIKit

extension UIStackView{
    public func RemoveArrangedSubview(subview: UIView){
        NSLayoutConstraint.deactivate(subview.constraints)
        subview.removeFromSuperview()
        removeArrangedSubview(subview)
    }
    public func RemoveAllArrangedSubviews(){
        while(!arrangedSubviews.isEmpty){
            RemoveArrangedSubview(subview: arrangedSubviews[0])
        }
    }
}


