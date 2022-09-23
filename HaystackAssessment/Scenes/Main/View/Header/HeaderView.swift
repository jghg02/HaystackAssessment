//
//  HeaderView.swift
//  HaystackAssessment
//
//  Created by Josue Hernandez on 20-09-22.
//

import UIKit

class HeaderView: UICollectionReusableView {

    // MARK: - IBOutlets

    @IBOutlet weak var titleLabel: UILabel!

    // MARK: - Methods

    func setupTitle(with title: String) {
        titleLabel.text = title
    }

}
