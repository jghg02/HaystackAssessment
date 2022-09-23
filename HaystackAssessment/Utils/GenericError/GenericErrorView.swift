//
//  GenericErrorView.swift
//  HaystackAssessment
//
//  Created by Josue Hernandez on 22-09-22.
//

import UIKit

class GenericErrorView: UIView {

    // MARK: - Outlets

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!

    // MARK: - Properties

    var callback: (() -> Void)?
    let nibName = "GenericErrorView"

    // MARK: - init Methods

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }

    func setUpView() {
        let name = String(describing: type(of: self))
        let nib = UINib(nibName: name, bundle: .main)
        nib.instantiate(withOwner: self, options: nil)
        fixViewInContainer(view: mainView, containerView: self)
    }

    func fixViewInContainer(view: UIView, containerView: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = containerView.frame
        containerView.addSubview(view)

        view.pinToEdges(of: containerView)
    }

    public func createErrorView(with image: String?, title: String?, subtitle: String?, actionTitle: String?, callback: (() -> Void)? = nil) {
        guard let title = title, let subtitle = subtitle, let actionTitle = actionTitle, let image = image else { return }
        self.callback = callback

        titleLabel.text = title
        subtitleLabel.text = subtitle
        actionButton.setTitle(actionTitle, for: .normal)

    }

    // MARK: - Action

    @IBAction func didTapActionButton(_ sender: Any) {
        if let callback = self.callback {
            callback()
        }
    }

}
