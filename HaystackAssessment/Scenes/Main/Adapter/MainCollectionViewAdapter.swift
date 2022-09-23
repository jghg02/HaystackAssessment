//
//  MainCollectionViewAdapter.swift
//  HaystackAssessment
//
//  Created by Josue Hernandez on 10-09-22.
//

import UIKit

final class MainCollectionViewAdapter: NSObject, UICollectionViewDataSource {

    // MARK: - Properties

    let collectionView: UICollectionView
    var data: [Resource?] = [] {
        didSet {
            self.collectionView.reloadData()
        }
    }
    var photo: Photo?
    var title: String = "Trending Now on Flickr"

    // MARK: - Init Method

    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()

        // Regsiter Cell
        self.collectionView.register(UINib(nibName: "ImageCell", bundle: nil), forCellWithReuseIdentifier: "ImageCell")
        // Register Header
        self.collectionView.register(UINib(nibName: "HeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderView")

        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }

    // MARK: - DataSources Methods

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath)
        guard let cell = cell as? ImageCell else { return UICollectionViewCell() }
        cell.loadData(with: data[indexPath.row], title: photo?.photos.photo[indexPath.row]?.title)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderView", for: indexPath) as? HeaderView
        header?.setupTitle(with: title)
        return header ?? UICollectionReusableView()
    }

}


// MARK: - Delegate Methods

extension MainCollectionViewAdapter: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected \(indexPath.row)")
    }

}

// MARK: - FlouLayout

extension MainCollectionViewAdapter: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 500, height: 400)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 100)
    }
}
