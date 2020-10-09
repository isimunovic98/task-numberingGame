//
//  ResultViewController.swift
//  TaskNumberingGame
//
//  Created by Ivan Simunovic on 08/10/2020.
//

import UIKit

class ResultViewController: UIViewController {
    
    //MARK: Properties
    var backingImage: UIImage?
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let dimmerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        view.alpha = 0.7
        return view
    }()
    
    let cardView: ResultStackView = {
        let view: ResultStackView = ResultStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: Init
    init(numberOfPlayers: String, directionChangeNumber: String, skippNumber: String ){

        cardView.setLastPlayerNumber(text: numberOfPlayers)
        cardView.setDirectionChangeNumber(text: directionChangeNumber)
        cardView.setSkipPlayerNumber(text: skippNumber)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupView()
        setupLayout()
    }
    
    //MARK: Methods
    private func setupView() {
    
        view.addSubview(backgroundImageView)
        view.addSubview(dimmerView)
        view.addSubview(cardView)
        
        backgroundImageView.image = backingImage
        
        roundCorners(view: cardView, radius: 20.0)
        
        // dimmerViewTapped() will be called when user tap on the dimmer view
        let dimmerTap = UITapGestureRecognizer(target: self, action: #selector(dimmerViewTapped(_:)))
        dimmerView.addGestureRecognizer(dimmerTap)
        dimmerView.isUserInteractionEnabled = true
    }
       
    private func setupLayout() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            dimmerView.topAnchor.constraint(equalTo: view.topAnchor),
            dimmerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dimmerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dimmerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
           cardView.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
           cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
           cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
           cardView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        ])
    }
    
    //MARK: Methods
    
    private func roundCorners(view: UIView, radius: CGFloat){
        view.clipsToBounds = true
        view.layer.cornerRadius = radius
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    @IBAction func dimmerViewTapped(_ tapRecognizer: UITapGestureRecognizer) {
        self.dismiss(animated: false, completion: nil)
    }

}
