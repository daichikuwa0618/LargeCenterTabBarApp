//
//  LCTabBar.swift
//  LargeCenterTabBarApp
//
//  Created by Daichi Hayashi on 2021/04/15.
//

import UIKit

protocol LCTabBarDelegate: AnyObject {
    func didTapCenterButton()
}

class LCTabBar: UITabBar {

    weak var lcDelegate: LCTabBarDelegate?

    private let centerButton: UIButton = UIButton()
    private let centerButtonHeight: CGFloat = 80

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCenterButton()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupCenterButton()
    }

    // UITabBar からはみ出した部分もタップできるようにする
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {

        let convertedPoint = centerButton.convert(point, from: self)

        if UIBezierPath(ovalIn: centerButton.bounds).contains(convertedPoint) {
            return true
        }

        return super.point(inside: point, with: event)
    }

    func setupCenterButton() {
        centerButton.setImage(UIImage(systemName: "command.circle.fill"), for: .normal)
        centerButton.imageView?.tintColor = .red
        centerButton.contentVerticalAlignment = .fill
        centerButton.contentHorizontalAlignment = .fill
        centerButton.addTarget(self, action: #selector(handleCenterButton), for: .touchUpInside)

        addSubview(centerButton)
        centerButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            centerButton.widthAnchor.constraint(equalToConstant: centerButtonHeight),
            centerButton.heightAnchor.constraint(equalToConstant: centerButtonHeight),
            centerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            centerButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    @objc
    func handleCenterButton() {
        lcDelegate?.didTapCenterButton()
    }
}
