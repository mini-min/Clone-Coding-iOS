//
//  CardSwiperViewController.swift
//  Study_iOS
//
//  Created by 민 on 2021/10/13.
//

import UIKit
import VerticalCardSwiper

class CardSwiperViewController: UIViewController {
    
    var isFrontCard: Bool = true
    
    @IBOutlet weak var firstCardSwiper: VerticalCardSwiper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstCardSwiper.delegate = self
        firstCardSwiper.datasource = self
        
        firstCardSwiper.register(nib: UINib(nibName: "FrontCardViewCell", bundle: nil), forCellWithReuseIdentifier: "FrontCardViewCell")
        firstCardSwiper.register(nib: UINib(nibName: "BackCardViewCell", bundle: nil), forCellWithReuseIdentifier: "BackCardViewCell")
        
        // setList()
    }
}

extension CardSwiperViewController: VerticalCardSwiperDelegate {
    func didTapCard(verticalCardSwiperView: VerticalCardSwiperView, index: Int) {
        if isFrontCard {
            isFrontCard = false
            guard let cell = firstCardSwiper.cardForItem(at: index) as? FrontCardViewCell else { return }
            UIView.transition(with: cell, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        } else {
            isFrontCard = true
            guard let cell = firstCardSwiper.cardForItem(at: index) as? FrontCardViewCell else { return }
            UIView.transition(with: cell, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
}

extension CardSwiperViewController: VerticalCardSwiperDatasource {
    func numberOfCards(verticalCardSwiperView: VerticalCardSwiperView) -> Int {
        return 2
    }
    
    func cardForItemAt(verticalCardSwiperView: VerticalCardSwiperView, cardForItemAt index: Int) -> CardCell {
        guard let cell = verticalCardSwiperView.dequeueReusableCell(withReuseIdentifier: "FrontCardViewCell", for: index) as? FrontCardViewCell else {
            return CardCell()
        }
        return cell
    }
    
}
