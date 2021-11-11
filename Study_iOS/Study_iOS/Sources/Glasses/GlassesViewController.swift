//
//  GlassesViewController.swift
//  Study_iOS
//
//  Created by 민 on 2021/11/11.
//

import UIKit

class GlassesViewController: UIViewController {

    // MARK: - Properties
    private let backgroundList = ["1", "2", "3", "4", "5", "6", "7"]
    private let personImageList = ["person1", "person2", "person3", "person4", "person5", "person6", "person7"]
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var faceImageView: UIImageView!
    @IBOutlet weak var glasseseCollectionView: UICollectionView!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        glasseseCollectionView.delegate = self
        glasseseCollectionView.dataSource = self
        glasseseCollectionView.register(BackgroundCollectionViewCell.nib(), forCellWithReuseIdentifier: "BackgroundCollectionViewCell")
    }
    
    // MARK: - @IBAction Properties
    
    // MARK: - @Functions
    private func setUI() {
        glasseseCollectionView.showsHorizontalScrollIndicator = false
        glasseseCollectionView.backgroundColor = .white
        let collectionViewLayout = glasseseCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        collectionViewLayout?.scrollDirection = .horizontal
    }
    
}
    // MARK: - Extensions
// MARK: - CollectionView Delegate
extension GlassesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return backgroundList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BackgroundCollectionViewCell", for: indexPath) as? BackgroundCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.initCell(image: backgroundList[indexPath.row])
        
        return cell
    }
}

// MARK: - CollectionView DataSource
extension GlassesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        faceImageView.image = UIImage(named: personImageList[indexPath.row])
    }
}

// MARK: - CollectionView Delegate Flow Layout
extension GlassesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 28, bottom: 7, right: 28)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 18
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: CGFloat(60), height: CGFloat(60))
    }
}
