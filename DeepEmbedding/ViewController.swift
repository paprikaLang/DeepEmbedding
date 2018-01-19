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
        print("Sending event \(event.data.name) , metadata: \(event.data.metadata)")
    }
}

//struct Event {
//    let name: String
//    let metadata: [String:String]
//}
enum Event {
    case tapMeTapped(count: Int)
//        return Event(name:"viewController.tapMeTapped",metadata:[:])
//    }
    case viewWillAppear(name: String,date:Date)
//        return Event(name:"viewController.appear", metadata: ["name":name,"time":"\(Date().timeIntervalSince1970)"])
//    }
}
func simpify(e1: Event, e2: Event) -> Event? {
    switch (e1, e2) {
    case let(.tapMeTapped(x),.tapMeTapped(y)):
        return .tapMeTapped(count: x + y)
    default:
        return nil
    }
}
extension Event {
    var data: (name: String, metadata: [String:String]){
        switch self {
        case .tapMeTapped:
            return (name:"viewController.tapMeTapped",metadata:[:])
        case .viewWillAppear(let name, let date):
            return (name:"viewController.appear", metadata: ["name":name,"time":"\(date.timeIntervalSince1970)"])
        }
    }
}
class ViewController: UIViewController {
    @IBAction func tapMeTapped(_ sender: Any) {
        AnalyticsBackend.shared.send(.tapMeTapped(count:5))
    }
    
   override  func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    AnalyticsBackend.shared.send(.viewWillAppear(name: "master",date:Date()))
    }

}


class DetailController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AnalyticsBackend.shared.send(.viewWillAppear(name: "detail",date:Date()))
    }
}
