//
//  CompletedCollectionViewCell.swift
//  Adventure
//
//  Created by Ivan Kostyrka on 04.11.2024.
//

import UIKit

class CompletedCollectionViewCell: UICollectionViewCell {
    
    var completedTask: TasksStorage?
    
    @IBOutlet
    weak var containerView: UIView!
    
    @IBOutlet
    weak var previewImageView: UIImageView!
    
    @IBOutlet
    weak var dayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    private func configure() {
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
        
        contentView.layer.borderWidth = 1.5
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 6
        layer.masksToBounds = false
        
        previewImageView.layer.cornerRadius = 10
        previewImageView.layer.masksToBounds = true
        previewImageView.contentMode = .scaleAspectFill
        
    }
    
    func set(day: String, image: String) {
        dayLabel.text = day
        previewImageView.image = UIImage(named: image)
    }
    
}
