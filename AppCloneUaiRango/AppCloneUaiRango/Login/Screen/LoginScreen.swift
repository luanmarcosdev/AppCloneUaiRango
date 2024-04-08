//
//  LoginScreen.swift
//  AppCloneUaiRango
//
//  Created by Luan Arruda on 08/04/24.
//

import UIKit

protocol LoginScreenDelegate: AnyObject {
    func actionBackButton()
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

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperView()
        self.configBackgroundViewConstraints()
        self.configMainViewConstraints()
        self.configLogoLabelConstraints()
        self.configCloseButtonConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func tappedBackButton() {
        self.delegate?.actionBackButton()
    }
    
    private func configSuperView() {
        self.addSubview(self.backgroundView)
        self.addSubview(self.mainView)
        self.addSubview(self.logoLabel)
        self.addSubview(self.closeButton)
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
    
    private func configCloseButtonConstraint() {
        self.closeButton.snp.makeConstraints { make in
            make.top.equalTo(self.logoLabel.snp.top)
            make.trailing.equalToSuperview().inset(40)
            make.width.height.equalTo(12)
        }
    }

}
