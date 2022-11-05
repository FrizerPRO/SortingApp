//
//  DetailViewController.swift
//  ProjectWithoutStoryboard
//
//  Created by Lebedev Petr on 24.10.2022.
//

import UIKit
class DetailViewController: UIViewController {
    var stackOfNumbersView = StackOfNumbersView()
    let stackOfNumbers = StackOfNumbers(capacity: Int(Constants.EmountOfNumbers.rawValue),maxValue: Int(Constants.MaxRandValue.rawValue))
    let randButton: UIButton = UIButton()
    let sortButton: UIButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        stackOfNumbersView.InitialiseUI()
        stackOfNumbersView.updateConstraints()
        initUI()
    }
    public func initUI(){
        view.backgroundColor = .white
        initSortButton()
        initRandButton()
        stackOfNumbersView.translatesAutoresizingMaskIntoConstraints = false
        stackOfNumbersView.initStackView(viewToAttachTo: view)
    }
    private func initSortButton(){
        view.addSubview(sortButton)
        sortButton.translatesAutoresizingMaskIntoConstraints = false
        sortButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
        sortButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: view.safeAreaLayoutGuide.layoutFrame.width/4).isActive = true
        sortButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        sortButton.widthAnchor.constraint(equalToConstant: view.frame.width/3).isActive = true
        sortButton.layer.cornerRadius = 10
        sortButton.backgroundColor = .red
        sortButton.setTitle("Sort", for: .normal)
        sortButton.addTarget(self, action: #selector(SortNumbers), for: .touchUpInside)
        sortButton.isEnabled = false
    }
    private func initRandButton(){
        view.addSubview(randButton)
        randButton.translatesAutoresizingMaskIntoConstraints = false
        randButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
        randButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -1*view.safeAreaLayoutGuide.layoutFrame.width/4).isActive = true
        randButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        randButton.widthAnchor.constraint(equalToConstant: view.frame.width/3).isActive = true
        randButton.layer.cornerRadius = 10
        randButton.backgroundColor = .gray
        randButton.setTitle("Rand", for: .normal)
        randButton.addTarget(self, action: #selector(FillStackView), for: .touchUpInside)
    }
}
