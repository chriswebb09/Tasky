//
//  ListsViewController.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import UIKit

class ListsViewController: UIViewController {
    
    static let lists: [List] = [
        List(name: "Test1", tasks: [], dateCreated: Date(), id: UUID().uuidString, lastUpdated: Date()),
        List(name: "Test2", tasks: [], dateCreated: Date(), id: UUID().uuidString, lastUpdated: Date()),
        List(name: "Test3", tasks: [], dateCreated: Date(), id: UUID().uuidString, lastUpdated: Date())
    ]
    
    enum Sections {
        case favorites
    }
    
    /// - Tag: recipeListDataSource
    private var listDataSource: UICollectionViewDiffableDataSource<Sections, List>!

    private var flowLayout = ColumnFlowLayout()
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        }
        
        listDataSource = UICollectionViewDiffableDataSource(collectionView: collectionView) {
            collectionView, indexPath, identifier -> UICollectionViewCell in
            let list = ListsViewController.lists[indexPath.row]
            return collectionView.dequeueConfiguredReusableCell(using: listCellRegistration, for: indexPath, item: list)
        }
    }
}

// MARK: - Factory

extension ListsViewController {
    static func getListVC() -> ListsViewController {
        let vc = ListsViewController()
        let item = UITabBarItem(title: nil, image: Tab.lists.image, selectedImage: Tab.lists.selectedImage)
        vc.tabBarItem = item
        return vc
    }
}
