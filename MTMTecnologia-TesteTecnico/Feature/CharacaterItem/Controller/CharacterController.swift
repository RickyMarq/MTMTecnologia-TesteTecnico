//
//  CharacterItemController.swift
//  MTMTecnologia-TesteTecnico
//
//  Created by Henrique Marques on 03/08/23.
//

import UIKit
import SDWebImage

class CharacterController: UIViewController {
    
    var characterScreen: CharacterItemView?
    var viewModel: CharacterViewModel?
    
    override func loadView() {
        self.characterScreen = CharacterItemView()
        self.view = characterScreen
    }
    
    init(viewModel: CharacterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpCharacterController()
    }
    
    func setUpCharacterController() {
        self.characterScreen?.idLabel.text = "#\(viewModel?.characterId ?? 0)"
        self.characterScreen?.characterNameLabel.text = viewModel?.characterName
        self.characterScreen?.characterImageView.sd_setImage(with: URL(string: viewModel?.characterImage ?? ""))
        self.characterScreen?.aliveLabel.text = viewModel?.characterAlive
        self.characterScreen?.locationCharacters.text = viewModel?.characterLocation
        self.characterScreen?.originCharacters.text = viewModel?.characterOrigin
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
