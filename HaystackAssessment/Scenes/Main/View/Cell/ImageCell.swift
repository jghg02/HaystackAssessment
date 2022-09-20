//
//  ImageCell.swift
//  HaystackAssessment
//
//  Created by Josue Hernandez on 10-09-22.
//

import UIKit
import TVUIKit

class ImageCell: UICollectionViewCell {

    // MARK: - Properties

    let posterView = TVPosterView()

    // MARK: - Outlets

    override var canBecomeFocused: Bool {
        return true
    }

    public func loadData(with data: Resource?, title: String?) {
        guard let data = data, let title = title else { return }
        let current = data.sizes.size.last as? Image

        posterView.title = title
        posterView.imageView.load(url: URL(string: current!.source)!)
        contentView.addSubview(posterView)
        posterView.pinToEdges(of: self)
    }

    override func prepareForReuse() {
        posterView.imageView.image = nil
    }


    
}
