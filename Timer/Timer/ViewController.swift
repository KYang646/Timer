//
//  ViewController.swift
//  Timer
//
//  Created by Kimball Yang on 3/29/20.
//  Copyright © 2020 Kimball Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let countLabel = UILabel()
    var timer: Timer!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabel()
        view.backgroundColor = .random()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(changeBackground), userInfo: nil, repeats: true)
    }
    
    @objc func changeBackground() {
        view.backgroundColor = .random()
        
        
    }

    func configureLabel() {
        view.addSubview(countLabel)
        
        countLabel.font = UIFont.systemFont(ofSize: 100, weight: .bold)
        countLabel.textAlignment = .center
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            countLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 300),
            countLabel.widthAnchor.constraint(equalToConstant: 300),

        ])
        
        
        
    }

    
    
    
}

