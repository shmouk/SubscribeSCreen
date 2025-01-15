import UIKit.UILayoutGuide

extension SubscribeViewController {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            closeImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            closeImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            closeImageView.widthAnchor.constraint(equalToConstant: 24),
            closeImageView.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            iphoneImageView.topAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor),
            iphoneImageView.bottomAnchor.constraint(equalTo: bgView.topAnchor, constant: -10).withPriority(.defaultHigh),
            iphoneImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iphoneImageView.widthAnchor.constraint(equalTo: iphoneImageView.heightAnchor),
            iphoneImageView.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor, multiplier: 0.8),
            iphoneImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            dateTitleLabel.topAnchor.constraint(equalTo: iphoneImageView.topAnchor, constant: 67),
            dateTitleLabel.centerXAnchor.constraint(equalTo: iphoneImageView.centerXAnchor),
            dateTitleLabel.heightAnchor.constraint(equalToConstant: 20),
            dateTitleLabel.widthAnchor.constraint(lessThanOrEqualTo: iphoneImageView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            timeTitleLabel.topAnchor.constraint(equalTo: iphoneImageView.topAnchor, constant: 102),
            timeTitleLabel.centerXAnchor.constraint(equalTo: iphoneImageView.centerXAnchor),
            timeTitleLabel.heightAnchor.constraint(equalToConstant: 56),
            timeTitleLabel.widthAnchor.constraint(lessThanOrEqualTo: iphoneImageView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            protectNotificationView.topAnchor.constraint(equalTo: iphoneImageView.topAnchor, constant: 112),
            protectNotificationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            protectNotificationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            protectNotificationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            protectNotificationView.heightAnchor.constraint(greaterThanOrEqualToConstant: 66)
        ])
        
        NSLayoutConstraint.activate([
            dataNotificationView.topAnchor.constraint(equalTo: protectNotificationView.bottomAnchor, constant: 8),
            dataNotificationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dataNotificationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            dataNotificationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            dataNotificationView.heightAnchor.constraint(greaterThanOrEqualToConstant: 66)
        ])
        
        NSLayoutConstraint.activate([
            middleNatificationView.bottomAnchor.constraint(equalTo: dataNotificationView.bottomAnchor, constant: 8),
            middleNatificationView.centerXAnchor.constraint(equalTo: dataNotificationView.centerXAnchor),
            middleNatificationView.widthAnchor.constraint(equalTo: dataNotificationView.widthAnchor, multiplier: 0.92),
            middleNatificationView.heightAnchor.constraint(equalTo: dataNotificationView.heightAnchor, multiplier: 0.92)
        ])
        
        NSLayoutConstraint.activate([
            bottomNatificationView.bottomAnchor.constraint(equalTo: middleNatificationView.bottomAnchor, constant: 8),
            bottomNatificationView.centerXAnchor.constraint(equalTo: middleNatificationView.centerXAnchor),
            bottomNatificationView.widthAnchor.constraint(equalTo: middleNatificationView.widthAnchor, multiplier: 0.92),
            bottomNatificationView.heightAnchor.constraint(equalTo: middleNatificationView.heightAnchor, multiplier: 0.92)
        ])
        
        NSLayoutConstraint.activate([
            bgView.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -10),
            bgView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bgView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            bgView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            bgView.heightAnchor.constraint(equalToConstant: 280)
        ])

        NSLayoutConstraint.activate([
            saleView.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 16),
            saleView.centerXAnchor.constraint(equalTo: bgView.centerXAnchor),
            saleView.heightAnchor.constraint(equalToConstant: 36),
            saleView.widthAnchor.constraint(greaterThanOrEqualToConstant: 129)
        ])
        NSLayoutConstraint.activate([
            saleGiftImageView.leadingAnchor.constraint(equalTo: saleView.leadingAnchor, constant: 12),
            saleGiftImageView.centerYAnchor.constraint(equalTo: saleView.centerYAnchor),
            saleGiftImageView.widthAnchor.constraint(equalToConstant: 16),
            saleGiftImageView.heightAnchor.constraint(equalTo: saleGiftImageView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            saleLabel.centerYAnchor.constraint(equalTo: saleView.centerYAnchor),
            saleLabel.topAnchor.constraint(equalTo: saleView.topAnchor, constant: 8),
            saleLabel.trailingAnchor.constraint(equalTo: saleView.trailingAnchor, constant: -8),
            saleLabel.bottomAnchor.constraint(equalTo: saleView.bottomAnchor, constant: -8),
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: saleView.bottomAnchor, constant: 6),
            titleLabel.centerXAnchor.constraint(equalTo: bgView.centerXAnchor),
            titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20)
        ])

        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subtitleLabel.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 16),
            subtitleLabel.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -16),
            subtitleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 22)
        ])

        NSLayoutConstraint.activate([
            subscriptionPlansTableView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 12),
            subscriptionPlansTableView.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 12),
            subscriptionPlansTableView.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -12),
            subscriptionPlansTableView.heightAnchor.constraint(equalToConstant: 64)
        ])

        NSLayoutConstraint.activate([
            timerSubtitleLabel.topAnchor.constraint(equalTo: subscriptionPlansTableView.bottomAnchor, constant: 8),
            timerSubtitleLabel.centerXAnchor.constraint(equalTo: bgView.centerXAnchor),
            timerSubtitleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 27)
        ])
        
        NSLayoutConstraint.activate([
            timerTitleLabel.topAnchor.constraint(equalTo: timerSubtitleLabel.bottomAnchor, constant: 4),
            timerTitleLabel.centerXAnchor.constraint(equalTo: bgView.centerXAnchor),
            timerTitleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 27)
        ])
        
        NSLayoutConstraint.activate([
            continueButton.bottomAnchor.constraint(equalTo: restoreLabel.topAnchor, constant: -12),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            continueButton.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        NSLayoutConstraint.activate([
            restoreLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            restoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            restoreLabel.heightAnchor.constraint(equalToConstant: 18),
            restoreLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 51)
        ])

        NSLayoutConstraint.activate([
            separatorLeftView.centerYAnchor.constraint(equalTo: restoreLabel.centerYAnchor),
            separatorLeftView.leadingAnchor.constraint(equalTo: termsLabel.trailingAnchor, constant: 8),
            separatorLeftView.trailingAnchor.constraint(equalTo: restoreLabel.leadingAnchor, constant: -8),
            separatorLeftView.heightAnchor.constraint(equalToConstant: 4),
            separatorLeftView.widthAnchor.constraint(equalToConstant: 4)
        ])


        NSLayoutConstraint.activate([
            separatorRightView.centerYAnchor.constraint(equalTo: restoreLabel.centerYAnchor),
            separatorRightView.leadingAnchor.constraint(equalTo: restoreLabel.trailingAnchor, constant: 8),
            separatorRightView.trailingAnchor.constraint(equalTo: privacyLabel.leadingAnchor, constant: -8),
            separatorRightView.heightAnchor.constraint(equalToConstant: 4),
            separatorRightView.widthAnchor.constraint(equalToConstant: 4)
        ])

        NSLayoutConstraint.activate([
            termsLabel.centerYAnchor.constraint(equalTo: restoreLabel.centerYAnchor),
            termsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 29),
            termsLabel.heightAnchor.constraint(equalToConstant: 18)
        ])

        NSLayoutConstraint.activate([
            privacyLabel.centerYAnchor.constraint(equalTo: restoreLabel.centerYAnchor),
            privacyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -29),
            privacyLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
}
