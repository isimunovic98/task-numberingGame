//
//  CustomView.swift
//  TaskNumberingGame
//
//  Created by Ivan Simunovic on 06/10/2020.
//

import UIKit

class InputView: UIView, UITextFieldDelegate {
    
    //MARK: Properties
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.systemOrange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.systemGray4
        textField.font = .systemFont(ofSize: 14)
        textField.placeholder = "Enter a number"
        textField.setLeftPaddingPoints(10)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
     
     private func setupView() {
        self.addSubview(label)
        self.addSubview(textField)
        
        textField.delegate = self
        
        setupLayout()
     }
    
    private func setupLayout(){
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            textField.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            textField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    //MARK: Methods
    func setLabelText(_ text: String?){
        guard let text = text else { return }
        label.text = text
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = "1234567890\\b"
        let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharacterSet = CharacterSet(charactersIn: string)
        return allowedCharacterSet.isSuperset(of: typedCharacterSet)
    }
    
    func getTextFieldText() -> String? {
        guard let text = self.textField.text else {return nil}
        return text
    }
}


//MARK: Extensions

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
