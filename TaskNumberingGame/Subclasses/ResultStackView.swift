//
//  ResultStackView.swift
//  TaskNumberingGame
//
//  Created by Ivan Simunovic on 08/10/2020.
//

import UIKit

class ResultStackView: UIView {

    //MARK: Properties
    let lastPlayerView: ResultInfoView = {
        let view = ResultInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setLabelText("Player who ended the game")
        return view
    }()
    
    let directionChangedView: ResultInfoView = {
        let view = ResultInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setLabelText("How many times did game change the direction")
        return view
    }()
    
    let numberSkippedView: ResultInfoView = {
        let view = ResultInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setLabelText("How many times did number get skipped")
        return view
    }()
    
    let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupView(){
        self.backgroundColor = .white
        self.addSubview(containerStackView)
        configureStackView()
        
        setupLayout()
    }
    private func configureStackView(){
        containerStackView.addArrangedSubview(lastPlayerView)
        containerStackView.addArrangedSubview(directionChangedView)
        containerStackView.addArrangedSubview(numberSkippedView)
    }
    
    private func setupLayout(){
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            containerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
    
    //MARK: Methods
    func setLastPlayerNumber(text: String){
        lastPlayerView.setTextField(text: text)
    }
    
    func setDirectionChangeNumber(text: String){
        directionChangedView.setTextField(text: text)
    }
    
    func setSkipPlayerNumber(text: String){
        numberSkippedView.setTextField(text: text)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
