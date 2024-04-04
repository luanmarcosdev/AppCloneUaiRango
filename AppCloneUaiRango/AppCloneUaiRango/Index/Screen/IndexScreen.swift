//
//  IndexScreen.swift
//  AppCloneUaiRango
//
//  Created by Luan Arruda on 03/04/24.
//

import UIKit

class IndexScreen: UIView {
    
    lazy var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.orange
        return view
    }()
    
    lazy var imageBackView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "salad2")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var logoLabel: UIView = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "UaiRango"
        lb.font = UIFont.systemFont(ofSize: 44)
        lb.textColor = CustomColor.white
        return lb
    }()
    
    lazy var cityButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Selecione sua cidade", for: .normal)
        bt.titleLabel?.font = .systemFont(ofSize: 16)
        bt.setTitleColor(CustomColor.white, for: .normal)
        bt.backgroundColor = CustomColor.orange
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 7.5
        return bt
    }()
    
    lazy var loginButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Logar/Cadastrar", for: .normal)
        bt.titleLabel?.font = .systemFont(ofSize: 16)
        bt.setTitleColor(CustomColor.white, for: .normal)
        bt.backgroundColor = CustomColor.green
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 7.5
        return bt
    }()
    
    lazy var buttonsStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.axis = .horizontal
        return stack
    }()
    
    lazy var useTermsLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Termos de uso"
        lb.font = UIFont.systemFont(ofSize: 16)
        lb.textColor = CustomColor.white
        return lb
    }()
    
    lazy var aboutLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Sobre o UaiRango"
        lb.font = UIFont.systemFont(ofSize: 16)
        lb.textColor = CustomColor.white
        return lb
    }()
    
    lazy var footerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.green
        return view
    }()
    
    lazy var labelFooter: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "www.uairango.com"
        lb.font = UIFont.systemFont(ofSize: 16)
        lb.textColor = CustomColor.white
        return lb
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperView()
        self.configBackgroundViewConstraints()
        self.configImageBackViewConstraints()
        self.configLogoLabelConstraints()
        self.configCityButtonConstraints()
        self.configLoginButtonConstraints()
        self.configButtonsStackView()
        self.configFooterViewConstraints()
        self.configLabelFooterConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configSuperView(){
        self.addSubview(self.backgroundView)
        self.addSubview(self.imageBackView)
        self.imageBackView.addSubview(self.logoLabel)
        self.imageBackView.addSubview(self.cityButton)
        self.imageBackView.addSubview(self.loginButton)
        self.imageBackView.addSubview(self.buttonsStackView)
        self.buttonsStackView.addArrangedSubview(self.useTermsLabel)
        self.buttonsStackView.addArrangedSubview(self.aboutLabel)
        self.addSubview(self.footerView)
        self.footerView.addSubview(self.labelFooter)
    }
    
    private func configBackgroundViewConstraints() {
        self.backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func configImageBackViewConstraints() {
        self.imageBackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).inset(-44)
            make.bottom.equalTo(self.footerView.snp.top)
        }
    }
    
    private func configLogoLabelConstraints(){
        self.logoLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.imageBackView.snp.top).offset(112)
        }
    }
    
    private func configCityButtonConstraints() {
        self.cityButton.snp.makeConstraints { make in
            make.height.equalTo(54)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(100)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().inset(40)
        }
    }
    
    private func configLoginButtonConstraints() {
        self.loginButton.snp.makeConstraints { make in
            make.height.equalTo(self.cityButton.snp.height)
            make.centerX.equalToSuperview()
            make.leading.equalTo(self.cityButton.snp.leading)
            make.trailing.equalTo(self.cityButton.snp.trailing)
            make.top.equalTo(self.cityButton.snp.bottom).offset(14)
        }
    }
    
    private func configButtonsStackView() {
        self.buttonsStackView.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.bottom.equalTo(self.footerView.snp.top).inset(10)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().inset(40)
        }
    }
    
    private func configFooterViewConstraints() {
        self.footerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(44)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func configLabelFooterConstraints(){
        self.labelFooter.snp.makeConstraints { make in
            make.centerX.equalTo(self.footerView.snp.centerX)
            make.centerY.equalTo(self.footerView.snp.centerY)
        }
    }
}
