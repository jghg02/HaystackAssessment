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
    @IBOutlet weak var loading: UIActivityIndicatorView!

    // MARK: - Properties

    let viewModel = MainViewModel()
    var searchViewModel: SearchViewModel?
    var resultView: ResultView?
    var searchFlag = false
    var searchData = [Resource?]()
    var titleHeader = ""
    var genericErrorView: GenericErrorView?

    // MARK: - LifeCycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()

        viewModel.showLoading.bind { [weak self] show in
            self?.loading.isHidden = show
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if searchFlag {
            guard let resultView = resultView else { return }
            resultView.adapter.title = titleHeader
            
            searchViewModel?.searchData.bind { [weak self] data in
                DispatchQueue.main.async {
                    self?.resultView?.data = data
                }
            }
        }
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

        self.viewModel.error.bind { [weak self] hasError in
            if hasError {
                DispatchQueue.main.async {
                    self?.loading.isHidden = true
                    self?.showErrorView(with: GenericError()) {
                        self?.viewModel.fetchPhotos()
                    }
                }
            }
        }
    }

    func showErrorView(with error: GenericError ,_ actionBlock: (() -> Void)?) {
        if let genericErrorView = genericErrorView {
            genericErrorView.removeFromSuperview()
        }
        genericErrorView = nil

        genericErrorView = GenericErrorView()
        guard let _ = genericErrorView?.createErrorView(with: error.imageUrl,
                                                        title: error.title,
                                                        subtitle: error.subTitle,
                                                        actionTitle: error.actionTitle,
                                                        callback: { [weak self] in

                                                            actionBlock?()
                                                            self?.genericErrorView?.removeFromSuperview()
                                                            self?.genericErrorView = nil

                                                        }) else {
            return
        }

        guard let genericErrorView = genericErrorView else { return }
        view.addSubview(genericErrorView)
        genericErrorView.pinToEdges(of: self.view)
    }


}
