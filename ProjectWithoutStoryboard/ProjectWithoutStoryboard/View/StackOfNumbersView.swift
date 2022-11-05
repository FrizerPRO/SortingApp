//
//  StackOfNumbersView.swift
//  ProjectWithoutStoryboard
//
//  Created by Lebedev Petr on 26.10.2022.
//

import UIKit

class StackOfNumbersView: UIScrollView {
    public let stack: UIStackView = UIStackView()
    public func InitialiseUI(){
        InitialiseScrollView()
        InitialiseStackView()
    }
    private func InitialiseScrollView(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
    }
    
    private func InitialiseStackView(){
        addSubview(stack)
        stack.alignment = .bottom
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stack.distribution = .equalSpacing
        stack.spacing = 1
        stack.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
    @objc
    public func AddCell(value: Int){
        let cell: UIButton = UIButton()
        cell.translatesAutoresizingMaskIntoConstraints = false
        cell.setTitle(String(value), for: .normal)
        cell.titleLabel?.adjustsFontSizeToFitWidth = true
        cell.tag = value
        cell.backgroundColor = .gray
        cell.widthAnchor.constraint(equalToConstant: Constants.CellWidth.rawValue).isActive = true
        stack.addArrangedSubview(cell)
    }
    public func initStackView(viewToAttachTo: UIView){
        viewToAttachTo.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: viewToAttachTo.safeAreaLayoutGuide.topAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: viewToAttachTo.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: viewToAttachTo.safeAreaLayoutGuide.trailingAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: viewToAttachTo.safeAreaLayoutGuide.bottomAnchor, constant: -80).isActive = true
    }
}
