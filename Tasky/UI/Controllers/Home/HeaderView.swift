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
        //settingName.font = UIFont(name: AppConstants.Font.Name.franklinSemibold, size: AppConstants.Font.Size.setting)
        //settingName.textColor = UIColor.contentColor
        //settingName.numberOfLines = AppConstants.UIConstants.LabelLines.fullSize
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
        
//        updateSettingLabelConstraints()
//        setupView()
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        self.addSubview(titleLabel)
//        updateSettingLabelConstraints()
//        setupView()
//    }
    

    func setupView() {
        titleLabel.textColor = UIColor.customGray
       // titleLabel.textColor = UIColor.white
       // titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.text = "Header"
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
        //titleLabel.text = "Header"
//        if let header = sectionType as? MovieSection {
//            titleLabel.text = header.sectionTitle
//        }
//
//        if let header = sectionType as? CategoreySection {
//            titleLabel.text = header.sectionTitle
//        }
    }
    
    
}
