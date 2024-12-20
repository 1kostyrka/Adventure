//
//  DashboardCollectionViewCell.swift
//  Adventure
//
//  Created by Ivan Kostyrka on 01.11.2024.
//

import UIKit

class DashboardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet
    weak var dayImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure() {
        dayImageView.clipsToBounds = true
    }
    
    func set(image: String) {
        if let image = UIImage(named: image) {
            dayImageView.image = image
        }
    }
}
