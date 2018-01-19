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

class ViewController: UIViewController {
    @IBAction func tapMeTapped(_ sender: Any) {
        AnalyticsBackend.shared.send(event: "viewController.tapMeTapped", metadata:[:] )
    }
    
   override  func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AnalyticsBackend.shared.send(event: "viewController.appear", metadata: ["name":"master","time":"\(Date().timeIntervalSince1970)"])
    }

}


class DetailController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AnalyticsBackend.shared.send(event: "viewController.appear", metadata: ["name":"detail","time":"\(Date().timeIntervalSince1970)"])
    }
}
