//
//  ResultView.swift
//  HaystackAssessment
//
//  Created by Josue Hernandez on 10-09-22.
//

import UIKit

class ResultView: UIView {

    // MARK: - Outlets

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties

    let nibName = "ResultView"
    var adapter: MainCollectionViewAdapter!
    var data: [Resource?] = [] {
        didSet {
            self.adapter.data = data
        }
    }

    // MARK: - init methods

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }

    // MARK: - Methods

    func setUpView() {
        let name = String(describing: type(of: self))
        let nib = UINib(nibName: name, bundle: .main)
        nib.instantiate(withOwner: self, options: nil)
        fixViewInContainer(view: mainView, containerView: self)

        self.adapter = MainCollectionViewAdapter(collectionView: self.collectionView)

    }

    func fixViewInContainer(view: UIView, containerView: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = containerView.frame
        containerView.addSubview(view)

        view.pinToEdges(of: containerView)
    }

    func reloadData() {
        adapter.collectionView.reloadData()
    }


}
