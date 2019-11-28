//
//  ViewController.swift
//  Showoff
//
//  Created by daniel.d4 on 03/02/2019.
//  Copyright © 2019 daniel.d4. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func viewDidAppear(_ animated: Bool) {
        whatsNewIfNeeded()
        
    }
    
    func whatsNewIfNeeded() {
        let items = [WhatsNew.Item(
                  title: "Video Search",
                  subtitle: "Carrot cake oat chocolate bonbon",
                  image: UIImage(named: "bus")),
                   WhatsNew.Item(title: "Transcription",
                                 subtitle: "Gummis cake sweet carrot cake mashmallow",
                                 image: UIImage(named: "car")),
                   WhatsNew.Item(title: "Really Awsome",
                                 subtitle: "Carrot cake tiramisu",
                                 image: UIImage(named: "user")),
                   WhatsNew.Item(title: "one more thing",
                                 subtitle: "Chupa chups cookie",
                                 image: UIImage(named: "bus"))
        
            
    ]
        let theme = WhatsNewViewController.Theme { configuration in
            configuration.apply(animation: .fade)
            configuration.backgroundColor = #colorLiteral(red: 0.1537904441, green: 0.1488657594, blue: 0.1489183009, alpha: 1)
            configuration.titleView.titleColor = #colorLiteral(red: 0.2815582156, green: 0.715687573, blue: 0.3169778287, alpha: 1)
            configuration.itemsView.titleColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            configuration.itemsView.subtitleColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            configuration.completionButton.backgroundColor = #colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1)
            configuration.titleView.titleFont = UIFont(name: "Futura", size: 45)!
            configuration.itemsView.titleFont = UIFont(name: "Futura", size: 35)!
            configuration.itemsView.subtitleFont = UIFont(name: "Futura", size: 20)!
        }
        let config = WhatsNewViewController.Configuration(theme: theme)
        
        let whatsNew = WhatsNew(title: "Cool new feature", items: items)
        
        let keyValueVersionStore = KeyValueWhatsNewVersionStore(keyValueable: UserDefaults.standard)
        
        let whatsNewVC = WhatsNewViewController(whatsNew: whatsNew, configuration: config, versionStore: keyValueVersionStore)
        
        if let vc = whatsNewVC {
            self.present(vc, animated: true)
        }
    }
    
}

