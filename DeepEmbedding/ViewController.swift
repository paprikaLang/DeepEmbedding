//
//  ViewController.swift
//  DeepEmbedding
//
//  Created by paprika on 2018/1/19.
//  Copyright © 2018年 paprika. All rights reserved.
//

import UIKit

final class AnalyticsBackend {
    static let shared = AnalyticsBackend()
    func send(event: String, metadata: [String:String]) {
        print("Sending event \(event) , metadata: \(metadata)")
    }
}
extension AnalyticsBackend {
    func tapMeTapped() {
        send(event: "viewController.tapMeTapped", metadata: [:])
    }
    func viewWillAppear(name: String) {
        send(event: "viewController.appear", metadata: ["name":name,"time":"\(Date().timeIntervalSince1970)"])
    }
}
class ViewController: UIViewController {
    @IBAction func tapMeTapped(_ sender: Any) {
        AnalyticsBackend.shared.tapMeTapped()
    }
    
   override  func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AnalyticsBackend.shared.viewWillAppear(name: "master")
    }

}


class DetailController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AnalyticsBackend.shared.viewWillAppear(name: "detail")
    }
}
