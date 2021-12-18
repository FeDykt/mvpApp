//
//  MainTableViewCell.swift
//  mvpApp
//
//  Created by fedot on 18.12.2021.
//

import UIKit

class MainTableViewCell: UITableViewCell {
   static let identifier = "Cell"
    let titleLabel = UILabel()
    let photoImage = UIImageView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        titleLabel.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        photoImage.frame = CGRect(x: 300, y: 0, width: 50, height: 50)
        contentView.addSubview(titleLabel)
        contentView.addSubview(photoImage)
    }
    
    func configure(model: Photos) {
        guard let url = URL(string: model.url) else { return }
        let imageData = try! Data(contentsOf: url)
        let image = UIImage(data: imageData)
    
        self.titleLabel.text = model.title
        self.photoImage.image = image
    }

}
