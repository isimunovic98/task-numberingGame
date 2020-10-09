//
//  ResultViewInfo.swift
//  TaskNumberingGame
//
//  Created by Ivan Simunovic on 07/10/2020.
//

import UIKit

class ResultInfoView: UIView {
    
    //MARK: Properties
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .center
        textField.backgroundColor = .systemOrange
        return textField
    }()
    
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
        
        setupLayout()
     }
    
    private func setupLayout(){
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5),
            textField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            textField.widthAnchor.constraint(equalToConstant: 40),
            textField.heightAnchor.constraint(equalToConstant: 40),
            textField.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    //MARK: Methods
    func setLabelText(_ text: String?){
        guard let text = text else { return }
        label.text = text
    }
    
    func setTextField(text: String){
        textField.text = text
    }
}
