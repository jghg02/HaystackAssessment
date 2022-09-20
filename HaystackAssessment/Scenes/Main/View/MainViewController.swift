//
//  MainViewController.swift
//  HaystackAssessment
//
//  Created by Josue Hernandez on 09-09-22.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Properties

    @IBOutlet weak var contentView: UIView!

    // MARK: - Properties

    let viewModel = MainViewModel()
    var resultView: ResultView?

    // MARK: - LifeCycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    // MARK: - Methods

    func setupView() {
        // hide navigation bar
        self.navigationController?.setNavigationBarHidden(true, animated: true)

        resultView = ResultView()
        guard let resultView = resultView else { return }
        view.addSubview(resultView)
        resultView.pinToEdges(of: self.contentView)

        viewModel.fetchPhotos()
        viewModel.data.bind { [weak self] data in
            DispatchQueue.main.async {
                self?.resultView?.data = data
            }
        }

        viewModel.photos.bind { [weak self] photo in
            self?.resultView?.adapter.photo = photo
        }
    }


}
