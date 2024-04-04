//
//  UseTermsScreen.swift
//  AppCloneUaiRango
//
//  Created by Luan Arruda on 04/04/24.
//

import UIKit

class UseTermsScreen: UIView {
    
    lazy var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.orangeBackground
        return view
    }()
    
    lazy var barView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.orangeMain
        return view
    }()
    
    lazy var backButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        bt.tintColor = CustomColor.whiteMain
        return bt
    }()
    
    lazy var logoLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "UaiRango"
        lb.textColor = CustomColor.whiteMain
        lb.font = .boldSystemFont(ofSize: 22)
        return lb
    }()
    
    lazy var backgroundTitleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.whiteSecond
        return view
    }()

    lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "TERMOS DE USO"
        lb.font = .systemFont(ofSize: 10)
        lb.textColor = CustomColor.orangeMain
        return lb
    }()
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.whiteMain
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperView()
        self.configBackgroundViewConstraints()
        self.configBarViewConstraint()
        self.configBackButtonConstraint()
        self.configLogoLabelConstraint()
        self.configBackgroundTitleViewConstraints()
        self.configTitleLabelConstraints()
        self.configMainViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configSuperView() {
        self.addSubview(self.backgroundView)
        self.addSubview(self.barView)
        self.barView.addSubview(self.backButton)
        self.barView.addSubview(self.logoLabel)
        self.addSubview(self.backgroundTitleView)
        self.addSubview(self.titleLabel)
        self.addSubview(self.mainView)
    }
    
    private func configBackgroundViewConstraints() {
        self.backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func configBarViewConstraint() {
        self.barView.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
        }
    }
    
    private func configBackButtonConstraint() {
        self.backButton.snp.makeConstraints { make in
            make.leading.equalTo(self.barView.snp.leading).offset(16)
            make.centerY.equalTo(self.barView.snp.centerY)
        }
    }
    
    private func configLogoLabelConstraint() {
        self.logoLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.backButton.snp.trailing).offset(16)
            make.centerY.equalTo(self.barView.snp.centerY)
        }
    }
    
    private func configBackgroundTitleViewConstraints() {
        self.backgroundTitleView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(24)
            make.top.equalTo(self.barView.snp.bottom)        }
    }
    
    private func configTitleLabelConstraints() {
        self.titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.backgroundTitleView.snp.centerX)
            make.centerY.equalTo(self.backgroundTitleView.snp.centerY)
        }
    }
    
    private func configMainViewConstraints() {
        self.mainView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(self.backgroundTitleView.snp.bottom)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
}
