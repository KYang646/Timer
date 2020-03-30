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
    var count = 1
    var loopCount = 0
    
    lazy var numberPosition: NSLayoutConstraint = {
        countLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabel()
        
        // Changes the background color to a random color when it loads
        view.backgroundColor = .random()
        
        // Timer runs the changeBackground func every 1.0 seconds
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(incrementCountLabel), userInfo: nil, repeats: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    @objc func changeBackground() {
        view.backgroundColor = .random()
        
        // Stops the timer after 5 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.timer.invalidate()
        }
    }
    
    @objc func incrementCountLabel() {
        count += 1 // Increments the count by 1 and then saves the value
        countLabel.text = String(count) // Changes the label to count value
        view.backgroundColor = .random() // Randomizes background color
        countLabel.alpha -= CGFloat(Double(count) * 0.01)
        print(CGFloat(10 * count))
        print((CGFloat(10 * count)) - (CGFloat(10 * count) * 2))
        
        if countLabel.alpha < 0.1 {
            countLabel.alpha = 1.0
        }
        
        switch loopCount % 2 {
            case 0:
                countLabel.textColor = .black
                
                let oldOffset = numberPosition.constant
                numberPosition.constant = oldOffset - 10
                UIView.animate(withDuration: 2) { [unowned self] in
                    self.view.layoutIfNeeded()
                }
            case 1:
                countLabel.textColor = .white
                let oldOffset = numberPosition.constant
                numberPosition.constant = oldOffset + 10
                UIView.animate(withDuration: 2) { [unowned self] in
                    self.view.layoutIfNeeded()
                }
            default:
                print("woops")
        }
        
        /*
         
         let oldOffset = blueSquareCenterYConstraint.constant
         blueSquareCenterYConstraint.constant = oldOffset - 150
         UIView.animate(withDuration: 2) { [unowned self] in
             self.view.layoutIfNeeded()
         }
         
         */
        
                while count > 9 {
                    view.backgroundColor = .brown
                    count = 1
                    loopCount += 1
                    print("Loop# \(loopCount)")
                        
                    if loopCount > 10 {
                        countLabel.textColor = .white
                        self.timer.invalidate() // This stops the timer after this function loops 3 times 10 times
                        }
                    }
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
        print("configggg")
    }

}

