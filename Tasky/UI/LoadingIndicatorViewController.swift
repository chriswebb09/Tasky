//
//  LoadingIndicatorViewController.swift
//  Tasky
//
//  Created by Christopher Webb on 2/16/22.
//

import UIKit

class LoadingIndicatorViewController: UIViewController {
    
    private var networkIndicator = UIActivityIndicatorView(style: .large)
    private var backgroundView = UIView()
    private var backingView = UIView()
    
    static let child = LoadingIndicatorViewController()
    
    override func loadView() {
        view = UIView()
        networkIndicator.style = .large
        networkIndicator.color = .white
        view.backgroundColor = .clear
        view.addSubview(backingView)
        view.addSubview(backgroundView)
        backgroundView.backgroundColor = .clear
        networkIndicator.translatesAutoresizingMaskIntoConstraints = false
        networkIndicator.startAnimating()
        backgroundView.addSubview(networkIndicator)
        networkIndicator.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
        networkIndicator.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor).isActive = true
    }
    
    static func addIndicatorView(viewController: UIViewController) {
        DispatchQueue.main.async {
            viewController.addChild(child)
            child.view.frame = viewController.view.frame
            child.backgroundView.frame = CGRect(x: UIScreen.main.bounds.midX - AppConstants.UIConstants.NetworkIndicator.xOffset, y: AppConstants.UIConstants.NetworkIndicator.yOffset, width: AppConstants.UIConstants.NetworkIndicator.width, height: AppConstants.UIConstants.NetworkIndicator.height)
            child.backingView.frame = child.backgroundView.frame
            child.backingView.backgroundColor = UIColor.transparentBackground
            child.backingView.layer.cornerRadius = AppConstants.UIConstants.NetworkIndicator.cornerRadius
            viewController.view.addSubview(child.view)
            child.didMove(toParent: viewController)
        }
    }
    
    static func removeIndicator() {
        DispatchQueue.main.async {
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
        }
    }
}

