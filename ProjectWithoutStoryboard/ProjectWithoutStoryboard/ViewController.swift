//
//  ViewController.swift
//  TestTryApp
//
//  Created by Lebedev Petr on 22.10.2022.
//

import UIKit

class ViewController: UIViewController {
    var stackOfAbilities:UIStackView = UIStackView()
    var scrollView: UIScrollView = UIScrollView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initializeStack()
    }
    fileprivate func createCell(_ name: String) {
        let cell = UIView();
        stackOfAbilities.addArrangedSubview(cell)
        cell.heightAnchor.constraint(equalToConstant: 25).isActive = true
        cell.translatesAutoresizingMaskIntoConstraints = false
        cell.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        cell.backgroundColor = .gray
        let text = UILabel()
        cell.addSubview(text)
        text.leadingAnchor.constraint(equalTo: cell.leadingAnchor,constant: 10).isActive = true
        text.text = name
        text.translatesAutoresizingMaskIntoConstraints = false
        let guesture = UITapGestureRecognizer(target: self, action: #selector(createMergeTab))
        cell.addGestureRecognizer(guesture)
    }
    @objc
    public func createMergeTab(){
        let detailsVC = DetailViewController()
        navigationController?.pushViewController(detailsVC,animated: true)
    }
    public func initializeStack(){
        view.addSubview(scrollView)
        scrollView.addSubview(stackOfAbilities)
        stackOfAbilities.axis = .vertical
        stackOfAbilities.alignment = .center
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackOfAbilities.translatesAutoresizingMaskIntoConstraints = false
        createCell("Insertion sort")
        stackOfAbilities.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackOfAbilities.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackOfAbilities.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        stackOfAbilities.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackOfAbilities.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
}

