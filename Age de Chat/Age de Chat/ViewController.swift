//
//  ViewController.swift
//  Age de Chat
//
//  Created by Mathias Bouillon on 29/04/2020.
//  Copyright © 2020 Mathias Bouillon. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var ageTextfield: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //code quand bouton est appuyé
    @IBAction func calculerAction(_ sender: Any) {
        //Ranger le clavier
        view.endEditing(true)
        
        //Vérifier que l'utilisateur à entré du texte
        if ageTextfield.text != nil {
            let texte = ageTextfield.text!
            if let nombreEntier = Int(texte) {
                let ageDeChat = nombreEntier * 7
                resultLabel.text = "Votre âge de chat est de \(ageDeChat) ans."
            }
            
        }
    }
    
    
    //Faire parler notre App
    @IBAction func soundAction(_ sender: Any) {
        if let texte = resultLabel.text {
            let speech = AVSpeechSynthesizer()
            let utterance = AVSpeechUtterance(string: texte)
            utterance.rate = 0.5
            utterance.voice = AVSpeechSynthesisVoice(language: "fr_FR")
            speech.speak(utterance)
        }
    }
    
}

