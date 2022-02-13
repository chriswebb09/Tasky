//
//  HeaderView.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    class var reuseId: String {
        return String(describing: self)
    }
    
    var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        titleLabel.textColor = UIColor.primaryColor
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(titleLabel)
        updateSettingLabelConstraints()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView() {
        titleLabel.textColor = UIColor.customGray
    }
    
    private func updateSettingLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: AppConstants.Constraints.SettingCell.labelLeading),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: AppConstants.Constraints.SettingCell.labelTrailing),
            titleLabel.heightAnchor.constraint(equalToConstant: AppConstants.Constraints.SettingCell.labelHeight)
        ])
    }
    
    func configureHeader(sectionType: AnyHashable) {
        if let header = sectionType as? FavoritesSection {
            titleLabel.text = header.sectionTitle
        }
        
        if let header = sectionType as? CategoreySection {
            titleLabel.text = header.sectionTitle
        }
    }
    
    
}
