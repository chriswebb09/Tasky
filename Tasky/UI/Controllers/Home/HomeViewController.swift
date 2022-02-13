//
//  HomeViewController.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import UIKit

class HomeViewController: BaseViewController {
    
    var listDataSource: UICollectionViewDiffableDataSource<Section<AnyHashable, [AnyHashable]>, AnyHashable>?
    private var flowLayout = ColumnFlowLayout()
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: configureLayout())
        self.view.addSubview(collectionView)
        self.configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getData()
        self.collectionView.backgroundColor = UIColor.backgroundColor
    }
    
    func getData() {
        var sections: [Section<AnyHashable, [AnyHashable]>] = []
        sections.append(Section(headerItem: FavoritesSection(media: List.lists),sectionItems: List.lists))
        sections.append(Section(headerItem: CategoreySection(categories: List.list2), sectionItems: List.list2))
        add(items: sections)
    }
    
    func configure() {
        collectionView.showsVerticalScrollIndicator = false
        collectionView.collectionViewLayout = configureLayout()
        collectionView.delegate = self
        collectionView.register(ListCollectionViewCell.self, forCellWithReuseIdentifier: ListCollectionViewCell.reuseId)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.reuseId)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: HeaderView.reuseId)
        configureCollectionView()
        configureSupplementaryView()
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
        listDataSource = UICollectionViewDiffableDataSource(collectionView: collectionView) { collectionView, indexPath, identifier -> UICollectionViewCell in
            var cell = UICollectionViewCell()
            if let list = identifier as? List {
                cell = collectionView.dequeueConfiguredReusableCell(using: listCellRegistration, for: indexPath, item: list)
            }
            return cell
        }
    }
    
    func add(items: [Section<AnyHashable, [AnyHashable]>]) {
        let payloadDatasource = DataSource(sections: items)
        var snapshot = NSDiffableDataSourceSnapshot<Section<AnyHashable, [AnyHashable]>, AnyHashable>()
        payloadDatasource.sections.forEach {
            snapshot.appendSections([$0])
            snapshot.appendItems($0.sectionItems)
        }
        listDataSource?.apply(snapshot, animatingDifferences: true)
    }
    
    func configureSupplementaryView() {
        listDataSource?.supplementaryViewProvider = { (collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView? in
            switch kind {
            case UICollectionView.elementKindSectionHeader:
                guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.reuseId, for: indexPath) as? HeaderView else {
                    return UICollectionReusableView()
                }
                let type = self.listDataSource?.snapshot().sectionIdentifiers[indexPath.section].headerItem
                headerView.configureHeader(sectionType: type!)
                return headerView
            default:
                guard let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: HeaderView.reuseId, for: indexPath) as? HeaderView else {
                    return UICollectionReusableView()
                }
                return footerView
            }
        }
    }
    
    func configureLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, _) -> NSCollectionLayoutSection? in
            let sectionType = self.listDataSource?.snapshot().sectionIdentifiers[sectionIndex].headerItem
            if sectionType is FavoritesSection {
                return UIHelper.getTightCellSectionLayout()
            }
            if sectionType is CategoreySection {
                return UIHelper.getCategoriesSectionLayout()
            }
            return nil
        }
        return layout
    }
}

extension HomeViewController: UICollectionViewDelegate { }

// MARK: - Factory

extension HomeViewController {
    static func getHomeVC() -> HomeViewController {
        let vc = HomeViewController()
        let item = UITabBarItem(title: nil, image: Tab.home.image, selectedImage: Tab.home.selectedImage)
        vc.tabBarItem = item
        return vc
    }
}
