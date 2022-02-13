//
//  HomeViewController.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import UIKit

class HomeViewController: BaseViewController {
    
    enum Sections {
        case favorites
    }
    
    private var listDataSource: UICollectionViewDiffableDataSource<Sections, List>!
    private var flowLayout = ColumnFlowLayout()
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        self.collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: flowLayout)
        self.view.addSubview(collectionView)
        collectionView.register(ListCollectionViewCell.self, forCellWithReuseIdentifier: ListCollectionViewCell.reuseId)
        configureCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        var snapshot = NSDiffableDataSourceSnapshot<Sections, List>()
        snapshot.appendSections([.favorites])
        snapshot.appendItems(List.lists, toSection:.favorites)
        listDataSource.apply(snapshot, animatingDifferences: true)
    }
    
    func configureCollectionView() {
        let listCellRegistration = UICollectionView.CellRegistration<ListCollectionViewCell, List> { cell, indexPath, list in
            cell.name.text = list.name
            cell.contentView.layer.shadowColor = UIColor.black.cgColor
            cell.contentView.layer.shadowOpacity = 0.27
            cell.contentView.layer.shadowOffset = CGSize(width: 1, height: 4.9)
            cell.contentView.layer.shadowRadius = 6
            cell.contentView.layer.cornerRadius = 10
        }
        
        listDataSource = UICollectionViewDiffableDataSource(collectionView: collectionView) {
            collectionView, indexPath, identifier -> UICollectionViewCell in
            let list = List.lists[indexPath.row]
            return collectionView.dequeueConfiguredReusableCell(using: listCellRegistration, for: indexPath, item: list)
        }
    }
}

// MARK: - Factory

extension HomeViewController {
    static func getHomeVC() -> HomeViewController {
        let vc = HomeViewController()
        let item = UITabBarItem(title: Tab.home.text, image: Tab.home.image, selectedImage: Tab.home.selectedImage)
        vc.tabBarItem = item
        return vc
    }
}
