//
//  LoginScreen.swift
//  AppCloneUaiRango
//
//  Created by Luan Arruda on 08/04/24.
//

import UIKit

protocol LoginScreenDelegate: AnyObject {
    func actionBackButton()
    func actionLinkLabel()
}

class LoginScreen: UIView {
    
    private var delegate: LoginScreenDelegate?
    
    public func setDelegate(delegate: LoginScreenDelegate?) {
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
    
    lazy var facebookButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Entrar com Facebook", for: .normal)
        bt.titleLabel?.font = .boldSystemFont(ofSize: 16)
        bt.setTitleColor(CustomColor.whiteMain, for: .normal)
        bt.backgroundColor = UIColor(_colorLiteralRed: 24/255, green: 119/255, blue: 242/255, alpha: 1)
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 7.5
        return bt
    }()
    
    lazy var googleButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Entrar com Google", for: .normal)
        bt.titleLabel?.font = .boldSystemFont(ofSize: 16)
        bt.setTitleColor(CustomColor.whiteMain, for: .normal)
        bt.backgroundColor = UIColor(_colorLiteralRed: 219/255, green: 68/255, blue: 55/255, alpha: 1)
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 7.5
        return bt
    }()
    
    lazy var appleButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Iniciar sessão com a Apple", for: .normal)
        bt.titleLabel?.font = .boldSystemFont(ofSize: 16)
        bt.setTitleColor(CustomColor.whiteMain, for: .normal)
        bt.backgroundColor = .black
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 7.5
        return bt
    }()
    
    lazy var labelUseTerms: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = 0
        lb.lineBreakMode = .byWordWrapping
        lb.textAlignment = .center
        lb.textColor = .systemGray
        lb.font = .systemFont(ofSize: 14)
        let text = "Ao acessar com as redes sociais, você está de acordo com nosso termos de uso"
        let attributedString = NSMutableAttributedString(string: text)
        let linkRange = (text as NSString).range(of: "termos de uso")
        attributedString.addAttribute(.link, value: "UseTerms", range: linkRange)
        attributedString.addAttribute(.foregroundColor, value: UIColor(.blue), range: linkRange)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: linkRange)
        lb.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedLinkLabel(_:)))
        lb.addGestureRecognizer(tapGesture)
        lb.attributedText = attributedString
        return lb
    }()
    
    lazy var divideLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "ou"
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
    
    lazy var passwordLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Senha"
        lb.textColor = .systemGray
        lb.font = .systemFont(ofSize: 14)
        return lb
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = CustomColor.whiteSecond
        tf.keyboardType = .default
        tf.isSecureTextEntry = true
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 7.5
        return tf
    }()
    
    lazy var loginButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Entrar", for: .normal)
        bt.titleLabel?.font = .boldSystemFont(ofSize: 16)
        bt.setTitleColor(CustomColor.whiteMain, for: .normal)
        bt.backgroundColor = CustomColor.green
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 7.5
        return bt
    }()
    
    lazy var forgotPasswordButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Esqueceu sua senha?", for: .normal)
        bt.titleLabel?.font = .boldSystemFont(ofSize: 14)
        bt.setTitleColor(CustomColor.green, for: .normal)
        bt.backgroundColor = .none
        return bt
    }()
    
    lazy var divideFooterView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray
        return view
    }()
    
    lazy var createAccountLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Ainda não faz parte do UaiRango?"
        lb.textColor = .systemGray
        lb.font = .boldSystemFont(ofSize: 16)
        return lb
    }()
    
    lazy var createAccountButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Criar conta", for: .normal)
        bt.titleLabel?.font = .boldSystemFont(ofSize: 16)
        bt.setTitleColor(CustomColor.green, for: .normal)
        bt.layer.borderWidth = 2
        bt.layer.borderColor = CGColor(red: 0/255, green: 145/255, blue: 71/255, alpha: 1)
        bt.backgroundColor = CustomColor.whiteMain
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 7.5
        return bt
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperView()
        self.configBackgroundViewConstraints()
        self.configMainViewConstraints()
        self.configLogoLabelConstraints()
        self.configCloseButtonConstraints()
        self.configFacebookButtonConstraints()
        self.configGoogleButtonConstraints()
        self.configAppleButtonConstraints()
        self.configLabelUseTermsConstraints()
        self.configDivideLabelConstraints()
        self.configDivideLeftViewConstraints()
        self.configDivideRightViewConstraints()
        self.configEmailLabelConstraints()
        self.configEmailTextFieldConstraints()
        self.configPasswordLabelConstraints()
        self.configPasswordTextFieldConstraints()
        self.configLoginButtonConstraints()
        self.configForgotPasswordButtonConstraints()
        self.configDivideFooterViewConstraints()
        self.configCreatAccountLabelConstraints()
        self.configCreatAccountButtonConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func tappedBackButton() {
        self.delegate?.actionBackButton()
    }
    
    @objc private func tappedLinkLabel(_ gesture: UITapGestureRecognizer) {
        guard let attributedString = (gesture.view as? UILabel)?.attributedText,
            let gestureRecognizer = gesture as? UITapGestureRecognizer else {
                return
            }
                
            let layoutManager = NSLayoutManager()
            let textContainer = NSTextContainer(size: .zero)
            let textStorage = NSTextStorage(attributedString: attributedString)
                
            layoutManager.addTextContainer(textContainer)
            textStorage.addLayoutManager(layoutManager)
                
            let location = gestureRecognizer.location(in: gestureRecognizer.view)
            let index = layoutManager.characterIndex(for: location, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
                
            attributedString.enumerateAttribute(.link, in: NSRange(location: 0, length: attributedString.length), options: []) { value, range, stop in
            if let linkValue = value as? String, linkValue == "UseTerms", NSLocationInRange(index, range) {
                delegate?.actionLinkLabel()
            }
        }
    }
    
    private func configSuperView() {
        self.addSubview(self.backgroundView)
        self.addSubview(self.mainView)
        self.addSubview(self.logoLabel)
        self.addSubview(self.closeButton)
        self.addSubview(self.facebookButton)
        self.addSubview(self.googleButton)
        self.addSubview(self.appleButton)
        self.addSubview(self.labelUseTerms)
        self.addSubview(self.divideLabel)
        self.addSubview(self.divideLeftView)
        self.addSubview(self.divideRightView)
        self.addSubview(self.emailLabel)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordLabel)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.loginButton)
        self.addSubview(self.forgotPasswordButton)
        self.addSubview(self.divideFooterView)
        self.addSubview(self.createAccountLabel)
        self.addSubview(self.createAccountButton)
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
            make.top.equalTo(self.mainView.snp.top).offset(48)
        }
    }
    
    private func configCloseButtonConstraints() {
        self.closeButton.snp.makeConstraints { make in
            make.top.equalTo(self.logoLabel.snp.top)
            make.trailing.equalToSuperview().inset(40)
            make.width.height.equalTo(12)
        }
    }
    
    private func configFacebookButtonConstraints() {
        self.facebookButton.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.logoLabel.snp.bottom).offset(22)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().inset(60)
        }
    }
    
    private func configGoogleButtonConstraints() {
        self.googleButton.snp.makeConstraints { make in
            make.height.equalTo(self.facebookButton.snp.height)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.facebookButton.snp.bottom).offset(10)
            make.leading.equalTo(self.facebookButton.snp.leading)
            make.trailing.equalTo(self.facebookButton.snp.trailing)
        }
    }
    
    private func configAppleButtonConstraints() {
        self.appleButton.snp.makeConstraints { make in
            make.height.equalTo(self.facebookButton.snp.height)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.googleButton.snp.bottom).offset(10)
            make.leading.equalTo(self.facebookButton.snp.leading)
            make.trailing.equalTo(self.facebookButton.snp.trailing)
        }

    }
    
    private func configLabelUseTermsConstraints() {
        self.labelUseTerms.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.appleButton.snp.bottom).offset(10)
            make.leading.equalTo(self.facebookButton.snp.leading)
            make.trailing.equalTo(self.facebookButton.snp.trailing)
        }
    }
    
    private func configDivideLabelConstraints() {
        self.divideLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.labelUseTerms.snp.bottom).offset(10)
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
            make.top.equalTo(self.divideLeftView.snp.bottom).offset(15)
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
    
    private func configPasswordLabelConstraints() {
        self.passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(self.emailTextField.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(40)
        }
    }
    
    private func configPasswordTextFieldConstraints() {
        self.passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(self.passwordLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().inset(40)
            make.height.equalTo(48)
        }
    }
    
    private func configLoginButtonConstraints() {
        self.loginButton.snp.makeConstraints { make in
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().inset(40)
            make.height.equalTo(48)
        }
    }
    
    private func configForgotPasswordButtonConstraints() {
        self.forgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(self.loginButton.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    }
    
    private func configDivideFooterViewConstraints() {
        self.divideFooterView.snp.makeConstraints { make in
            make.top.equalTo(self.forgotPasswordButton.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().inset(40)
            make.height.equalTo(1)
        }
    }
    
    private func configCreatAccountLabelConstraints() {
        self.createAccountLabel.snp.makeConstraints { make in
            make.top.equalTo(self.divideFooterView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    }
    
    private func configCreatAccountButtonConstraints() {
        self.createAccountButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().inset(40)
            make.height.equalTo(48)
            make.top.equalTo(self.createAccountLabel.snp.bottom).offset(15)
        }
    }

}
