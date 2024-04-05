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
    
    lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.whiteSecond
        return view
    }()
    
    lazy var headerLabel: UILabel = {
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
    
    lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "TERMOS E CONDIÇÕES"
        lb.font = .boldSystemFont(ofSize: 16)
        lb.textColor = .black
        return lb
    }()
    
    lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.showsVerticalScrollIndicator = true
        sv.showsHorizontalScrollIndicator = false
        return sv
    }()
    
    lazy var textLabel: UILabel = {
        let lb = UILabel()
        lb.text = LoremIpsum.text
        lb.numberOfLines = 0
        lb.lineBreakMode = .byWordWrapping
        lb.font = .systemFont(ofSize: 12)
        lb.textColor = .black
        return lb
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperView()
        self.configBackgroundViewConstraints()
        self.configBarViewConstraint()
        self.configBackButtonConstraint()
        self.configLogoLabelConstraint()
        self.configHeaderViewConstraints()
        self.configHeaderLabelConstraints()
        self.configMainViewConstraints()
        self.configScrollViewConstraints()
        self.configTitleLabelConstraints()
        self.configTextLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configSuperView() {
        self.addSubview(self.backgroundView)
        self.addSubview(self.barView)
        self.barView.addSubview(self.backButton)
        self.barView.addSubview(self.logoLabel)
        self.addSubview(self.headerView)
        self.addSubview(self.headerLabel)
        self.addSubview(self.mainView)
        self.mainView.addSubview(self.scrollView)
        self.scrollView.addSubview(self.titleLabel)
        self.scrollView.addSubview(self.textLabel)
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
    
    private func configHeaderViewConstraints() {
        self.headerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(24)
            make.top.equalTo(self.barView.snp.bottom)        }
    }
    
    private func configHeaderLabelConstraints() {
        self.headerLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.headerView.snp.centerX)
            make.centerY.equalTo(self.headerView.snp.centerY)
        }
    }
    
    private func configMainViewConstraints() {
        self.mainView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(self.headerView.snp.bottom)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func configScrollViewConstraints() {
        self.scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func configTitleLabelConstraints() {
        self.titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(18)
            make.top.equalTo(self.scrollView.snp.top).offset(24)
        }
    }
    
    private func configTextLabelConstraints() {
        self.textLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.titleLabel.snp.leading)
            make.trailing.equalToSuperview().inset(16)
            make.top.equalTo(self.titleLabel.snp.bottom).offset(10)
            make.bottom.equalToSuperview().inset(24)
            make.width.equalToSuperview().inset(16)
        }
    }
    
}
