//
//  NavBar.swift
//  AppCloneUaiRango
//
//  Created by Luan Arruda on 04/04/24.
//

import UIKit

class NavBar: UIView {
    
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

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperView()
        self.configBarViewConstraint()
        self.configBackButtonConstraint()
        self.configLogoLabelConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configSuperView() {
        self.addSubview(self.barView)
        self.addSubview(self.backButton)
        self.addSubview(self.logoLabel)
    }
    
    private func configBarViewConstraint() {
        self.barView.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview()
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

}
