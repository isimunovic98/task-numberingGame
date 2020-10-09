//
//  InputStackView.swift
//  TaskNumberingGame
//
//  Created by Ivan Simunovic on 08/10/2020.
//

import UIKit

class InputStackView: UIView {
    //MARK: Properties
    let stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    let numberOfPlayersView: InputView = {
        let view = InputView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setLabelText("Number of players:")
        return view
    }()
    
    let changeDirectionView: InputView = {
        let view = InputView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setLabelText("Change direction*")
        return view
    }()
    
    let skipPlayerView: InputView = {
        let view = InputView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setLabelText("Skip Player*")
        return view
    }()
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: Methods
    private func setupView(){
        self.addSubview(stackView)
        setupLayout()
        configureStackView()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func configureStackView(){
        stackView.addArrangedSubview(numberOfPlayersView)
        stackView.addArrangedSubview(changeDirectionView)
        stackView.addArrangedSubview(skipPlayerView)
    }
    
    func getNumberOfPlayers() -> String?{
        return numberOfPlayersView.getTextFieldText()
    }
    
    func getDirectionChangeNumber() -> String? {
        return changeDirectionView.getTextFieldText()
    }
    
    func getSkippNumber() -> String? {
        return skipPlayerView.textField.text!
    }
}
