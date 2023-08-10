//
//  TabBarController.swift
//  MTMTecnologia-TesteTecnico
//
//  Created by Henrique Marques on 03/08/23.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTabBar()
    }
    
    func setUpTabBar() {
        let home = UINavigationController(rootViewController: HomeController())
        let onboarding = UINavigationController(rootViewController: OnboardingController())
        self.tabBar.tintColor = .systemPurple
        self.setViewControllers([home, onboarding], animated: true)
        guard let items = tabBar.items else {return}
        items[0].image = UIImage(systemName: "house")
        items[0].title = "Home"
        items[1].image = UIImage(systemName: "info")
        items[1].title = "Onboarding"
    }
}
