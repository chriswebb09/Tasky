//
//  ListCollectionViewCell.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    
    class var reuseId: String {
        return String(describing: self)
    }
    
    // MARK: UI Properties
    
    var name: UILabel = {
        let settingName = UILabel()
        settingName.translatesAutoresizingMaskIntoConstraints = false
        return settingName
    }()
    
    private let arrowImage: UIImageView = {
        let arrowImage = UIImageView()
        arrowImage.translatesAutoresizingMaskIntoConstraints = false
        arrowImage.contentMode = .scaleAspectFit
        return arrowImage
    }()
    
    private let imageBackgroundView: UIView = {
        let imageBackgroundView = UIView()
        imageBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        return imageBackgroundView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Setup methods

extension ListCollectionViewCell {
    
    private func setup() {
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.addSubview(name)
        contentView.addSubview(imageBackgroundView)
        updateSettingLabelConstraints()
        updateImageConstraints()
        imageBackgroundView.addSubview(arrowImage)
        updateArrowImageConstraints()
        self.contentView.backgroundColor = .white
        //setupTap()
    }
    
    private func updateSettingLabelConstraints() {
        NSLayoutConstraint.activate([
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: AppConstants.Constraints.SettingCell.labelLeading),
            name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: AppConstants.Constraints.SettingCell.labelTrailing),
            name.heightAnchor.constraint(equalToConstant: AppConstants.Constraints.SettingCell.labelHeight)
        ])
    }
    
    private func updateImageConstraints() {
        NSLayoutConstraint.activate([
            imageBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageBackgroundView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageBackgroundView.heightAnchor.constraint(equalToConstant: AppConstants.Constraints.SettingCell.imageBackgroundHeight),
            imageBackgroundView.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ])
    }
    
    private func updateArrowImageConstraints() {
        NSLayoutConstraint.activate([
            arrowImage.trailingAnchor.constraint(equalTo: imageBackgroundView.trailingAnchor, constant: AppConstants.Constraints.SettingCell.arrowTrailing),
            arrowImage.centerYAnchor.constraint(equalTo: imageBackgroundView.centerYAnchor),
            arrowImage.heightAnchor.constraint(equalToConstant: AppConstants.Constraints.SettingCell.arrowHeight),
            arrowImage.widthAnchor.constraint(equalToConstant: AppConstants.Constraints.SettingCell.arrowHeight)
        ])
    }
}
