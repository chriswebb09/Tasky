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
        titleLabel.textAlignment = .center
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
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 14),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: AppConstants.Constraints.SettingCell.labelHeight)
        ])
    }
    
    func configureHeader(sectionType: AnyHashable) {
        if let header = sectionType as? TagsSection {
            titleLabel.isHidden = true
            
        }
        
        if let header = sectionType as? TasksDueSection {
            titleLabel.text = header.sectionTitle
            titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        }
    }
    
    
}
