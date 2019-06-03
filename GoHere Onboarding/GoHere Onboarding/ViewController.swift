//
//  ViewController.swift
//  GoHere Onboarding
//
//  Created by Pim Dieks on 17/05/2019.
//  Copyright © 2019 Pim Dieks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    func updateTextView() {
        
        let text = textView.text ?? ""
        
        let policyPath = "https://www.gohere.app/assets/pdf/privacy-policy.html"
        let termsPath = "https://www.gohere.app/assets/pdf/terms-of-use.html"
        
        let policyRange = NSAttributedString.rangeForSubstring(string: text, target: "Privacy Policy")
        let termsRange = NSAttributedString.rangeForSubstring(string: text, target: "Terms of Service")

        let policyLink = NSAttributedString.Link(path: policyPath, range: policyRange)
        let termsLink = NSAttributedString.Link(path: termsPath, range: termsRange)
        
        let attributedString = NSAttributedString.makeHyperlink(for: text, links: [policyLink, termsLink])
    
        let font = textView.font
        let align = textView.textAlignment
        textView.attributedText = attributedString
        textView.font = font
        textView.textAlignment = align
        
    }

    @IBAction func resetButton(_ sender: Any) {
        
        UIApplication.shared.open(URL(string: "http://www.gohere.app/")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func continueButton(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "App", bundle: nil)
        let mainVC = storyboard.instantiateViewController(withIdentifier: "mainVC") as! ViewController
        self.present(mainVC, animated: true, completion: {
            
            UserDefaults.standard.set(true, forKey: "hasLaunched")
        })
    }
    
    @IBAction func skipButton(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "App", bundle: nil)
        let mainVC = storyboard.instantiateViewController(withIdentifier: "mainVC") as! ViewController
        self.present(mainVC, animated: true, completion: {
            
            UserDefaults.standard.set(true, forKey: "hasLaunched")
        })
    }
}
