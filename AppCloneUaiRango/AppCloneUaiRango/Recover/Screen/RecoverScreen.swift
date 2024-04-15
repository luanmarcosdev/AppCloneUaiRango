//
//  RecoverScreen.swift
//  AppCloneUaiRango
//
//  Created by Luan Arruda on 15/04/24.
//

import UIKit

protocol RecoverScreenDelegate: AnyObject {
    func actionBackButton()
    func actionLoginButton()
}

class RecoverScreen: UIView {
    
    private var delegate: RecoverScreenDelegate?
    
    public func setDelegate(delegate: RecoverScreenDelegate?){
        self.delegate = delegate
    }

    lazy var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.orangeBackground
        return view
    }()
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.whiteMain
        return view
    }()
    
    lazy var logoLabel: UIView = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "UaiRango"
        lb.font = UIFont.systemFont(ofSize: 44)
        lb.textColor = .systemGray
        return lb
    }()

    lazy var closeButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setImage(UIImage(systemName: "xmark"), for: .normal)
        bt.tintColor = .systemGray
        bt.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return bt
    }()
    
    lazy var divideLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Recuperação"
        lb.font = .systemFont(ofSize: 16)
        lb.textColor = .black
        return lb
    }()
    
    lazy var divideLeftView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray
        return view
    }()
    
    lazy var divideRightView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray
        return view
    }()
    
    lazy var emailLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "E-mail"
        lb.textColor = .systemGray
        lb.font = .systemFont(ofSize: 14)
        return lb
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = CustomColor.whiteSecond
        tf.keyboardType = .emailAddress
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 7.5
        return tf
    }()
    
    lazy var recoverAccountButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Recuperar", for: .normal)
        bt.titleLabel?.font = .boldSystemFont(ofSize: 16)
        bt.setTitleColor(CustomColor.whiteMain, for: .normal)
        bt.backgroundColor = CustomColor.green
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 7.5
        return bt
    }()
    
    lazy var divideFooterView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray
        return view
    }()
    
    lazy var loginLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Quer realizar login?"
        lb.textColor = .systemGray
        lb.font = .boldSystemFont(ofSize: 16)
        return lb
    }()
    
    lazy var loginButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Fazer Login", for: .normal)
        bt.titleLabel?.font = .boldSystemFont(ofSize: 16)
        bt.setTitleColor(CustomColor.green, for: .normal)
        bt.layer.borderWidth = 2
        bt.layer.borderColor = CGColor(red: 0/255, green: 145/255, blue: 71/255, alpha: 1)
        bt.backgroundColor = CustomColor.whiteMain
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 7.5
        bt.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return bt
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperView()
        self.configBackgroundViewConstraints()
        self.configMainViewConstraints()
        self.configLogoLabelConstraints()
        self.configCloseButtonConstraints()
        self.configDivideLabelConstraints()
        self.configDivideLeftViewConstraints()
        self.configDivideRightViewConstraints()
        self.configEmailLabelConstraints()
        self.configEmailTextFieldConstraints()
        self.configRecoverAccountButtonConstraints()
        self.configDivideFooterViewConstraints()
        self.configLoginLabelConstraints()
        self.configLoginButtonConstraints()
    }
    
    @objc private func tappedBackButton() {
        self.delegate?.actionBackButton()
    }
    
    @objc private func tappedLoginButton() {
        self.delegate?.actionLoginButton()
    }
    
    private func configSuperView() {
        self.addSubview(self.backgroundView)
        self.addSubview(self.mainView)
        self.addSubview(self.logoLabel)
        self.addSubview(self.closeButton)
        self.addSubview(self.divideLabel)
        self.addSubview(self.divideLeftView)
        self.addSubview(self.divideRightView)
        self.addSubview(self.emailLabel)
        self.addSubview(self.emailTextField)
        self.addSubview(self.recoverAccountButton)
        self.addSubview(self.divideFooterView)
        self.addSubview(self.loginLabel)
        self.addSubview(self.loginButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configBackgroundViewConstraints() {
        self.backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func configMainViewConstraints() {
        self.mainView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func configLogoLabelConstraints() {
        self.logoLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.mainView.snp.top).offset(200)
        }
    }
    
    private func configCloseButtonConstraints() {
        self.closeButton.snp.makeConstraints { make in
            make.top.equalTo(self.logoLabel.snp.top)
            make.trailing.equalToSuperview().inset(40)
            make.width.height.equalTo(12)
        }
    }
    
    private func configDivideLabelConstraints() {
        self.divideLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.logoLabel.snp.bottom).offset(10)
        }
    }
    
    private func configDivideLeftViewConstraints() {
        self.divideLeftView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalTo(self.divideLabel.snp.leading).inset(-5)
            make.centerY.equalTo(self.divideLabel.snp.centerY)
            make.height.equalTo(1)
        }
    }
    
    private func configDivideRightViewConstraints() {
        self.divideRightView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(40)
            make.leading.equalTo(self.divideLabel.snp.trailing).offset(5)
            make.centerY.equalTo(self.divideLabel.snp.centerY)
            make.height.equalTo(self.divideLeftView.snp.height)
        }
    }
    
    private func configEmailLabelConstraints() {
        self.emailLabel.snp.makeConstraints { make in
            make.top.equalTo(self.divideRightView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(40)
        }
    }
    
    private func configEmailTextFieldConstraints() {
        self.emailTextField.snp.makeConstraints { make in
            make.top.equalTo(self.emailLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().inset(40)
            make.height.equalTo(48)
        }
    }
    
    private func configRecoverAccountButtonConstraints() {
        self.recoverAccountButton.snp.makeConstraints { make in
            make.top.equalTo(self.emailTextField.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().inset(40)
            make.height.equalTo(48)
        }
    }
    
    private func configDivideFooterViewConstraints() {
        self.divideFooterView.snp.makeConstraints { make in
            make.top.equalTo(self.recoverAccountButton.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().inset(40)
            make.height.equalTo(1)
        }
    }
    
    private func configLoginLabelConstraints() {
        self.loginLabel.snp.makeConstraints { make in
            make.top.equalTo(self.divideFooterView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    }
    
    private func configLoginButtonConstraints() {
        self.loginButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().inset(40)
            make.height.equalTo(48)
            make.top.equalTo(self.loginLabel.snp.bottom).offset(15)
        }
    }

}
