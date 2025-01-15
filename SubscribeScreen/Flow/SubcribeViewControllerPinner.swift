import UIKit.UILayoutGuide

extension SubscribeViewController {
    func setupConstraints() {
        let iphoneImageViewOffset: CGFloat = (Constants.screenHeight < 800) ? 10 : Constants.screenHeight * 0.116
        let bgViewOffset: CGFloat  = (Constants.screenHeight < 800) ? 12 : 28
        
        NSLayoutConstraint.activate([
            closeImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            closeImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            closeImage.widthAnchor.constraint(equalToConstant: 24),
            closeImage.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            iphoneImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: iphoneImageViewOffset),
            iphoneImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iphoneImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 306), // а чего не через отступы по бокам и соотнощение высоты с шириной? Тогда бы не такой отступ конский был бы на больщом резолюшене (я на про макс смотрю)
            iphoneImageView.widthAnchor.constraint(lessThanOrEqualToConstant: 302)
        ])
        
        NSLayoutConstraint.activate([
            dateTitle.topAnchor.constraint(equalTo: iphoneImageView.topAnchor, constant: 67),
            dateTitle.centerXAnchor.constraint(equalTo: iphoneImageView.centerXAnchor),
            dateTitle.heightAnchor.constraint(equalToConstant: 20),
            dateTitle.widthAnchor.constraint(lessThanOrEqualTo: iphoneImageView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            timeTitle.topAnchor.constraint(equalTo: iphoneImageView.topAnchor, constant: 102),
            timeTitle.centerXAnchor.constraint(equalTo: iphoneImageView.centerXAnchor),
            timeTitle.heightAnchor.constraint(equalToConstant: 56),
            timeTitle.widthAnchor.constraint(lessThanOrEqualTo: iphoneImageView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            topNotificationImageView.topAnchor.constraint(equalTo: iphoneImageView.topAnchor, constant: 112),
            topNotificationImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topNotificationImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            topNotificationImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            topNotificationImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 66)
        ])
        
        NSLayoutConstraint.activate([
            middleNotificationImageView.topAnchor.constraint(equalTo: topNotificationImageView.bottomAnchor, constant: 8),
            middleNotificationImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            middleNotificationImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            middleNotificationImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            middleNotificationImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 82)
        ])
        
        NSLayoutConstraint.activate([
            bgView.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -bgViewOffset),
            bgView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bgView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            bgView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            bgView.heightAnchor.constraint(equalToConstant: 280)
        ])

        NSLayoutConstraint.activate([
            saleImageView.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 16),
            saleImageView.centerXAnchor.constraint(equalTo: bgView.centerXAnchor),
            saleImageView.heightAnchor.constraint(equalToConstant: 36),
            saleImageView.widthAnchor.constraint(equalToConstant: 129)
        ])

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: saleImageView.bottomAnchor, constant: 6),
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
            timerSubtitle.topAnchor.constraint(equalTo: subscriptionPlansTableView.bottomAnchor, constant: 8),
            timerSubtitle.centerXAnchor.constraint(equalTo: bgView.centerXAnchor),
            timerSubtitle.heightAnchor.constraint(greaterThanOrEqualToConstant: 27)
        ])
        
        NSLayoutConstraint.activate([
            timerTitle.topAnchor.constraint(equalTo: timerSubtitle.bottomAnchor, constant: 4),
            timerTitle.centerXAnchor.constraint(equalTo: bgView.centerXAnchor),
            timerTitle.heightAnchor.constraint(greaterThanOrEqualToConstant: 27)
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
            separatorLeft.centerYAnchor.constraint(equalTo: restoreLabel.centerYAnchor),
            separatorLeft.leadingAnchor.constraint(equalTo: termsLabel.trailingAnchor, constant: 8),
            separatorLeft.trailingAnchor.constraint(equalTo: restoreLabel.leadingAnchor, constant: -8),
            separatorLeft.heightAnchor.constraint(equalToConstant: 4),
            separatorLeft.widthAnchor.constraint(equalToConstant: 4)
        ])


        NSLayoutConstraint.activate([
            separatorRight.centerYAnchor.constraint(equalTo: restoreLabel.centerYAnchor),
            separatorRight.leadingAnchor.constraint(equalTo: restoreLabel.trailingAnchor, constant: 8),
            separatorRight.trailingAnchor.constraint(equalTo: privacyLabel.leadingAnchor, constant: -8),
            separatorRight.heightAnchor.constraint(equalToConstant: 4),
            separatorRight.widthAnchor.constraint(equalToConstant: 4)
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

// запусти на промаксе. Посмотри на шарики-сепараторы. Они явно не по центру. Суть констрейнтов, чтобы не зависеть от разрешения экрана, чтобы само растягивало. Это касается и верхних констант - если бы ты не захардкодил размеры картинки верхней, а написал через отступы, то тогда бы она авторастягивалась на оставшееся после кнопки и бг пространство и не нужны никакие константы тогда.

// досконально с линейкой не сидел - остальное попало вроде в макет, ну и молодец
