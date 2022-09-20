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

    // MARK: - Init Method

    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()

        // Cell
        self.collectionView.register(UINib(nibName: "ImageCell", bundle: nil), forCellWithReuseIdentifier: "ImageCell")

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
}
