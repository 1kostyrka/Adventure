//
//  CompletedDataSource.swift
//  Adventure
//
//  Created by Ivan Kostyrka on 04.11.2024.
//

import UIKit

extension CompletedViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TaskService.shared.completedTasks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CompletedCollectionViewCell.self), for: indexPath) as! CompletedCollectionViewCell
        let completedTask = TaskService.shared.completedTasks[indexPath.item]
        cell.set(day: completedTask.day, image: completedTask.image ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 16
        let availableWidth = collectionView.frame.width - padding * 2
        let widthPerItem = availableWidth / 2
        
        return CGSize(width: widthPerItem, height: widthPerItem * 1.3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            let deleteAction = UIAction(title: "Delete", image: UIImage(systemName: "trash.circle"), attributes: .destructive) { _ in
                TaskService.shared.completedTasks.remove(at: indexPath.item)
                collectionView.reloadData()
            }
            
            return UIMenu(title: "Options", children: [deleteAction])
        }
    }
}
