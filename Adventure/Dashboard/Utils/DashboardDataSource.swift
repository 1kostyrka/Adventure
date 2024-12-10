//
//  DashboardDataSource.swift
//  Adventure
//
//  Created by Ivan Kostyrka on 01.11.2024.
//

import UIKit

extension DashboardViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return days.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: DashboardCollectionViewCell.self), for: indexPath) as! DashboardCollectionViewCell
        let imageNames = (1...25).map { "\($0)" }
        cell.set(image: imageNames[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 10
        let totalWidth = collectionView.frame.width - (padding * 4)
        let width = totalWidth / 5
        return CGSize(width: width, height: width)
    }
}
