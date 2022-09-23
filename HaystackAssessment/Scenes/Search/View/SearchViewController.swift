//
//  SearchViewController.swift
//  HaystackAssessment
//
//  Created by Josue Hernandez on 20-09-22.
//

import UIKit

class SearchViewController: UIViewController {

    // MARK: - Properties

    let viewModel = SearchViewModel()

    // MARK: - IBOutlets

    @IBOutlet weak var searchTextField: UITextField!

    // MARK: - LifeCicle Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    // MARK: - Methods

    func setupView() {
        // hide navigation bar
        self.navigationController?.setNavigationBarHidden(true, animated: true)

        searchTextField.delegate = self
    }

}

// MARK: - UITextField Delegate

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.viewModel.goToShowSearchResult(searchText: textField.text, tabBar: self.tabBarController)

        return true
    }

}
