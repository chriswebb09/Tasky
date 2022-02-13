//
//  ListsViewController.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import UIKit

class ListsViewController: BaseViewController {
    
    var listDataSource: UICollectionViewDiffableDataSource<Section<AnyHashable, [AnyHashable]>, AnyHashable>?
    private var flowLayout = ColumnFlowLayout()
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.title = "Lists"
        self.collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: flowLayout)
        self.view.addSubview(collectionView)
        configureCollectionView()
        configureSupplementaryView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        var sections: [Section<AnyHashable, [AnyHashable]>] = []
        sections.append(Section(headerItem: FavoritesSection(media: List.lists),sectionItems: List.lists))
        sections.append(Section(headerItem: CategoreySection(categories: List.list2), sectionItems: List.list2))
        let payloadDatasource = DataSource(sections: sections)
        var snapshot = NSDiffableDataSourceSnapshot<Section<AnyHashable, [AnyHashable]>, AnyHashable>()
        payloadDatasource.sections.forEach {
            snapshot.appendSections([$0])
            snapshot.appendItems($0.sectionItems)
        }
        listDataSource?.apply(snapshot, animatingDifferences: true)
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
        //        listDataSource = UICollectionViewDiffableDataSource(collectionView: collectionView) {
        //            collectionView, indexPath, identifier -> UICollectionViewCell in
        //            let list = List.lists[indexPath.row]
        //            return collectionView.dequeueConfiguredReusableCell(using: listCellRegistration, for: indexPath, item: list)
        //        }
    }
    
    func configureSupplementaryView() {
        listDataSource?.supplementaryViewProvider = { (collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView? in
            switch kind {
            case UICollectionView.elementKindSectionHeader:
                guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.reuseId, for: indexPath) as? HeaderView else { return UICollectionReusableView() }
                headerView.configureHeader(sectionType: (self.listDataSource?.snapshot().sectionIdentifiers[indexPath.section].headerItem)!)
                return headerView
            default:
                guard let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: HeaderView.reuseId, for: indexPath) as? HeaderView else { return UICollectionReusableView() }
                return footerView
            }
        }
    }
}

// MARK: - Factory

extension ListsViewController {
    static func getListVC() -> ListsViewController {
        let vc = ListsViewController()
        let item = UITabBarItem(title: nil, image: Tab.list.image, selectedImage: Tab.list.selectedImage)
        vc.tabBarItem = item
        return vc
    }
}
