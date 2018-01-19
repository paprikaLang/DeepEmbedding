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
    func send(_ event: Event) {
        print("Sending event \(event.name) , metadata: \(event.metadata)")
    }
}

struct Event {
    let name: String
    let metadata: [String:String]
}
extension Event {
    static func tapMeTapped() -> Event {
        return Event(name:"viewController.tapMeTapped",metadata:[:])
    }
    static func viewWillAppear(name: String) -> Event{
        return Event(name:"viewController.appear", metadata: ["name":name,"time":"\(Date().timeIntervalSince1970)"])
    }
}
class ViewController: UIViewController {
    @IBAction func tapMeTapped(_ sender: Any) {
        AnalyticsBackend.shared.send(.tapMeTapped())
    }
    
   override  func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AnalyticsBackend.shared.send(.viewWillAppear(name: "master"))
    }

}


class DetailController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AnalyticsBackend.shared.send(.viewWillAppear(name: "detail"))
    }
}
