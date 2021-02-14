//
//  DetailViewController.swift
//  FunnyGiphy
//
//  Created by Yuza on 2021/02/14.
//

import UIKit
import SnapKit
import Kingfisher

final class DetailViewController: BaseViewController {

    private let userType: UserType

    init(userType: UserType) {
        self.userType = userType

        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

    private func setUp() {
        view.backgroundColor = .white

        let containerView = UIStackView()
        containerView.axis = .vertical
        containerView.spacing = CGFloat(8)
        view.addSubview(containerView)
        containerView.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin).inset(16)
            maker.bottom.equalTo(self.view).inset(16)

            maker.left.right.equalTo(self.view).inset(16)
        }

        let titleLabel = UILabel()
        titleLabel.text = userType.name
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        containerView.addArrangedSubview(titleLabel)

        let pictureView = UIImageView()
        pictureView.kf.setImage(with: URL(string: userType.thumbnailUrl)!)
        containerView.addArrangedSubview(pictureView)
        //    pictureView.snp.makeConstraints { (maker) in
        //      maker.height.lessThanOrEqualTo(180)
        //    }

        let descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = userType.address
        descriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        containerView.addArrangedSubview(descriptionLabel)
    }

}
