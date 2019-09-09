//
//  MainViewModel.swift
//  KVO_Example
//
//  Created by Milkyo on 09/09/2019.
//  Copyright © 2019 MilKyo. All rights reserved.
//

import Foundation

class MainViewModel: NSObject {
    @objc dynamic var idVaild = false
    @objc dynamic var passwordVaild = false
    @objc dynamic var vaildButton = false
    var observation = [NSKeyValueObservation]()

    func idCheck(_ id: String?) {
        guard let _ = id else {
            self.idVaild = false
            return
        }

        if id!.count < 10, id!.count > 0 {
            self.idVaild = true
        } else {
            self.idVaild = false
        }
    }

    func passwordCheck(_ password: String?) {
        guard let _ = password else {
            self.passwordVaild = false
            return
        }

        if password!.count > 5, password!.contains("!") || password!.contains("@") || password!.contains("#") {
            self.passwordVaild = true
        } else {
            self.passwordVaild = false
        }
    }

    override init() {
        super.init()
        self.observation.append(self.observe(\.idVaild, options: [.new]) { [weak self] _, change in
            guard let self = self else { return }

            if let value = change.newValue {
                self.vaildButton = value && self.passwordVaild
            }
        })

        self.observation.append(self.observe(\.passwordVaild, options: [.new]) { [weak self] _, change in
            guard let self = self else { return }

            if let value = change.newValue {
                self.vaildButton = value && self.idVaild
            }
        })
    }
}
