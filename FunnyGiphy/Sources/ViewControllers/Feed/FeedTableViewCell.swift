//
//  FeedTableViewCell.swift
//  FunnyGiphy
//
//  Created by Lee Won-woo on 2021/01/10.
//

import UIKit
import SnapKit
import Kingfisher

final class FeedTableViewCell: UITableViewCell {
    
    private let thumbnail = UIImageView()
    private let title = UILabel()
    private let subtitle = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 16
        contentView.addSubview(horizontalStackView)
        horizontalStackView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
        
        horizontalStackView.addArrangedSubview(thumbnail)
        thumbnail.snp.makeConstraints { (maker) in
            maker.width.height.equalTo(72)
        }
        
        let verticalStackView = UIStackView()
        verticalStackView.axis = . vertical
        verticalStackView.spacing = 8
        
        verticalStackView.addArrangedSubview(title)
        verticalStackView.addArrangedSubview(subtitle)
        horizontalStackView.addArrangedSubview(verticalStackView)
    }
    
    func configure(user: UserType) {
        title.text = user.name
        subtitle.text = user.address
        if let url = URL(string: user.thumbnailUrl) {
            thumbnail.kf.setImage(with: url)
        }
    }
}
