//
//  ListsViewController.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import UIKit

class ListsViewController: BaseViewController {

    enum Sections {
        case favorites
    }
    
    private var listDataSource: UICollectionViewDiffableDataSource<Sections, List>!
    private var flowLayout = ColumnFlowLayout()
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Lists"
        self.collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: flowLayout)
        self.view.addSubview(collectionView)
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
            let list = List.lists[indexPath.row]
            return collectionView.dequeueConfiguredReusableCell(using: listCellRegistration, for: indexPath, item: list)
        }
    }
}

// MARK: - Factory

extension ListsViewController {
    static func getListVC() -> ListsViewController {
        let vc = ListsViewController()
        let item = UITabBarItem(title: Tab.new.text, image: Tab.new.image, selectedImage: Tab.new.selectedImage)
        vc.tabBarItem = item
        return vc
    }
}
