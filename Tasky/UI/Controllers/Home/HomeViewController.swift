//
//  HomeViewController.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    static let lists: [List] = [
        List(name: "Test1", tasks: [], dateCreated: Date(), id: UUID().uuidString, lastUpdated: Date()),
        List(name: "Test2", tasks: [], dateCreated: Date(), id: UUID().uuidString, lastUpdated: Date()),
        List(name: "Test3", tasks: [], dateCreated: Date(), id: UUID().uuidString, lastUpdated: Date()),
        List(name: "Test4", tasks: [], dateCreated: Date(), id: UUID().uuidString, lastUpdated: Date())
    ]
    
    enum Sections {
        case favorites
    }
    
    /// - Tag: listDataSource
    private var listDataSource: UICollectionViewDiffableDataSource<Sections, List>!
    private var flowLayout = ColumnFlowLayout()
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        self.collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: flowLayout)
        self.view.addSubview(collectionView)
        configureCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        var snapshot = NSDiffableDataSourceSnapshot<Sections, List>()
        snapshot.appendSections([.favorites])
        snapshot.appendItems(ListsViewController.lists, toSection:.favorites)
        listDataSource.apply(snapshot, animatingDifferences: true)
    }
    
    func configureCollectionView() {
        
        let listCellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, List> { cell, indexPath, list in
            var contentConfiguration = UIListContentConfiguration.subtitleCell()
            contentConfiguration.text = list.name
            contentConfiguration.secondaryText = list.id
            cell.contentConfiguration = contentConfiguration
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOpacity = 0.27
            cell.layer.shadowOffset = CGSize(width: 1, height: 4.9)
            cell.layer.shadowRadius = 6
        }
        
        listDataSource = UICollectionViewDiffableDataSource(collectionView: collectionView) {
            collectionView, indexPath, identifier -> UICollectionViewCell in
            let list = ListsViewController.lists[indexPath.row]
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
