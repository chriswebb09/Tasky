//
//  HomeViewController.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import UIKit
import SwiftUI

extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}

class HomeViewController: BaseViewController {
    
    var listDataSource: UICollectionViewDiffableDataSource<Section<AnyHashable, [AnyHashable]>, AnyHashable>?
    private var flowLayout = ColumnFlowLayout()
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView = UICollectionView(frame: CGRect(x: 0, y: 200, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 200), collectionViewLayout: configureLayout())
        let header = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200))
        header.backgroundColor = UIColor.backgroundColor
        let headerText = HeaderText(headerText: "Welcome Chris!").background(.clear)
        self.addSubSwiftUIView(headerText, to: header)
        self.view.addSubview(header)
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
        var tags = List.lists.map { $0.tag }
        
        tags.append(contentsOf: List.list2.map { $0.tag })
        tags = Array(Set(tags)).uniqued()
        sections.append(Section(headerItem: TagsSection(media: tags),sectionItems: tags))
        sections.append(Section(headerItem: TasksDueSection(tasks: Task.tasks), sectionItems: Task.tasks))
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
        let tasksDueCellRegistrations = UICollectionView.CellRegistration<ListCollectionViewCell, Task> { cell, indexPath, task in
            cell.name.text = task.title
            cell.contentView.layer.shadowColor = UIColor.black.cgColor
            cell.contentView.layer.shadowOpacity = 0.27
            cell.contentView.layer.shadowOffset = CGSize(width: 1, height: 4.9)
            cell.contentView.layer.shadowRadius = 6
            cell.contentView.layer.cornerRadius = 14
        }
        
        let tagCellRegistration = UICollectionView.CellRegistration<ListCollectionViewCell, Tag> { cell, indexPath, tag in
            cell.name.text = tag.subject
            cell.contentView.layer.shadowColor = UIColor.black.cgColor
            cell.contentView.layer.shadowOpacity = 0.27
            cell.contentView.layer.shadowOffset = CGSize(width: 1, height: 4.9)
            cell.contentView.layer.shadowRadius = 6
            cell.contentView.layer.cornerRadius = 14
        }
        
        listDataSource = UICollectionViewDiffableDataSource(collectionView: collectionView) { collectionView, indexPath, identifier -> UICollectionViewCell in
            var cell = UICollectionViewCell()
            if let task = identifier as? Task {
                cell = collectionView.dequeueConfiguredReusableCell(using: tasksDueCellRegistrations, for: indexPath, item: task)
            }
            if let tag = identifier as? Tag {
                cell = collectionView.dequeueConfiguredReusableCell(using: tagCellRegistration, for: indexPath, item: tag)
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
            if sectionType is TagsSection {
                return UIHelper.getTightCellSectionLayout()
            }
            if sectionType is TasksDueSection {
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
