//
//  StackOfNumbersViewController.swift
//  ProjectWithoutStoryboard
//
//  Created by Lebedev Petr on 25.10.2022.
//

import UIKit

extension DetailViewController {
    
    @objc
    public func FillStackView(){
        stackOfNumbersView.stack.RemoveAllArrangedSubviews()
        stackOfNumbers.ReRand()
        for i in stackOfNumbers.numbers{
            stackOfNumbersView.AddCell(value: i)
        }
        AllignStackHeight()
        sortButton.isEnabled = true
    }
    @objc
    public func SortNumbers(){
        sortButton.isEnabled = false
        randButton.isEnabled = false
        InsertionSort()

    }
    private func InsertionSort(){
        InsertElemInSorted(byPos: 1)
    }
    private func InsertElemInSorted(byPos pos: Int){
        if(pos == stackOfNumbersView.stack.arrangedSubviews.count - 1){
            sortButton.isEnabled = true
            randButton.isEnabled = true

        }
        var posToInsert: Int = pos
        while(posToInsert>0 && stackOfNumbersView.stack.arrangedSubviews[pos].tag<stackOfNumbersView.stack.arrangedSubviews[posToInsert - 1].tag){
            posToInsert-=1;
        }
        InsertElementWithAnimation(elementPos: pos, inserPos: posToInsert)
    }
    private func InsertElementWithAnimation(elementPos: Int, inserPos : Int){
        let viewToMove = stackOfNumbersView.stack.arrangedSubviews[elementPos]
        UIView.animate(withDuration: Constants.ColorChangeAnimationTime.rawValue, delay: 0,
                       animations: {
            viewToMove.backgroundColor = .orange
        }){[self, viewToMove] _ in
            UIView.animate(withDuration: Constants.PlaceChangeAnimationTime.rawValue, delay: 0, animations: { [viewToMove,self] in
                self.stackOfNumbersView.stack.insertArrangedSubview(viewToMove, at: inserPos)
            }, completion: { [viewToMove]
                complition in
                UIView.animate(withDuration: Constants.ColorChangeAnimationTime.rawValue, delay: 0, animations: {
                    viewToMove.backgroundColor = .gray
                },completion: { [self]_ in
                    if(elementPos < self.stackOfNumbersView.stack.arrangedSubviews.count - 1){
                        InsertElemInSorted(byPos: elementPos + 1)
                    }
                })
            })
        }
    }
    public func AllignStackHeight(){
        var maxValue: CGFloat = 0;
        for i in stackOfNumbersView.stack.arrangedSubviews{
            if(CGFloat(i.tag) > maxValue){
                maxValue = CGFloat(i.tag)
            }
        }
        for i in stackOfNumbersView.stack.arrangedSubviews{
            i.heightAnchor.constraint(equalToConstant: stackOfNumbersView.bounds.height*CGFloat(i.tag)/maxValue).isActive = true
        }
    }
}
