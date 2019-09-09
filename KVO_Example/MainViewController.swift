//
//  ViewController.swift
//  KVO_Example
//
//  Created by Milkyo on 09/09/2019.
//  Copyright © 2019 MilKyo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    let mainViewModel: MainViewModel
    var observation = [NSKeyValueObservation]()

    @IBOutlet var loginButton: UIButton!
    @IBAction func idTextFieldChanged(_ sender: UITextField) {
        self.mainViewModel.idCheck(sender.text)
    }

    @IBAction func passwordTextFieldChanged(_ sender: UITextField) {
        self.mainViewModel.passwordCheck(sender.text)
    }

    @objc func touchTap(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            self.view.endEditing(true)
        }
    }

    // MARK: - View Cycle

    required init?(coder aDecoder: NSCoder) {
        self.mainViewModel = MainViewModel()
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        self.observation.append(self.mainViewModel.observe(\.vaildButton, options: [.new]) { [weak self] _, change in
            guard let self = self else { return }

            if let value = change.newValue {
                print(value)
                self.loginButton.isEnabled = value
            }
        })

        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.touchTap)))
    }
}
