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
                guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.reuseId, for: indexPath) as? HeaderView else { return UICollectionReusableView() }
                headerView.configureHeader(sectionType: (self.listDataSource?.snapshot().sectionIdentifiers[indexPath.section].headerItem)!)
                return headerView
            default:
                guard let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: HeaderView.reuseId, for: indexPath) as? HeaderView else { return UICollectionReusableView() }
                return footerView
            }
        }
    }
    
    func configureLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, _) -> NSCollectionLayoutSection? in
            let sectionType = self.listDataSource?.snapshot().sectionIdentifiers[sectionIndex].headerItem
            if sectionType is FavoritesSection {
                return self.getTightCellSectionLayout()
            }
            if sectionType is CategoreySection {
                return self.getCategoriesSectionLayout()
            }
            return nil
        }
        return layout
    }
    
    
    func getTightCellSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(190), heightDimension: .absolute(320))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let sectionLayout = NSCollectionLayoutSection(group: group)
        sectionLayout.orthogonalScrollingBehavior = .continuous
        sectionLayout.interGroupSpacing = 20
        sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 40)
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(78))
        let headerSupplementary = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(9))
        let sectionFooter = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize, elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
        sectionLayout.boundarySupplementaryItems = [headerSupplementary, sectionFooter]
        return sectionLayout
    }
    
    func getCategoriesSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(75))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(20)
        let sectionLayout = NSCollectionLayoutSection(group: group)
        sectionLayout.interGroupSpacing = 20
        sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20)
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(78))
        let headerSupplementary = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        sectionLayout.boundarySupplementaryItems = [headerSupplementary]
        return sectionLayout
    }
}

extension HomeViewController: UICollectionViewDelegate {
    
}

// MARK: - Factory

extension HomeViewController {
    static func getHomeVC() -> HomeViewController {
        let vc = HomeViewController()
        let item = UITabBarItem(title: nil, image: Tab.home.image, selectedImage: Tab.home.selectedImage)
        vc.tabBarItem = item
        return vc
    }
}
