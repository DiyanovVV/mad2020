//
//  ViewController.swift
//  Diyanov MADAdventure
//
//  Created by DiyanovVV on 02.11.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tutorImage: UIImageView!
    @IBOutlet weak var tutorTitleLabel: UILabel!
    @IBOutlet weak var tutorDescLabel: UILabel!
    @IBOutlet weak var tutorPageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    
    var imageArray = ["first-Tutor", "Second-Tutor", "Third-Tutor"]
    var titleArray = ["Select the quest!", "Complete the task!", "Become a Top Key Finder"]
    var descriptionArray = ["A huge collection of different quests. Historical, children's, outdoors and many others...", "Search for secret keys, location detection, step counting and much more...", "User ratings, quest ratings, quest author ratings..."]
    
    var indexForTutor = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switchInfo()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func skipButtonAction(_ sender: Any) {
        performLogin()
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        if indexForTutor == 5 {
            performLogin()
        }
        indexForTutor += 1
        if indexForTutor <= 2 {
        switchInfo()
        tutorPageControl.currentPage = indexForTutor
        }
        if indexForTutor == 2 {
            nextButton.setTitle("Done", for: .normal)
            indexForTutor += 3
        }
        
    }
    
    
    
    func switchInfo() {
        tutorImage.image = UIImage(named: imageArray[indexForTutor])
        tutorTitleLabel.text = titleArray[indexForTutor]
        tutorDescLabel.text = descriptionArray[indexForTutor]
    }
    
    func performLogin() {
        UserDefaults.standard.set("Yes", forKey: "firstStart")
        performSegue(withIdentifier: "TutorToLogin", sender: self)
    }
}

