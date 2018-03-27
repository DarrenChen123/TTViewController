//
//  ViewController.swift
//  TTViewController
//
//  Created by Darren on 3/26/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import UIKit

let FeedbackViewControllerIdentifier = "TTFeedbackViewController"
class TTViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let text = "欢迎使用探探，在使用过程中有疑问请反馈"
        let attributedString = NSMutableAttributedString(string: text)
        if let range = text.range(of: "反馈") {
            attributedString.addAttribute(.link, value: URL(string:"tt://TTFeedbackViewController") ?? "", range: NSRange(range, in: text))
            textView.linkTextAttributes = [NSAttributedStringKey.foregroundColor.rawValue: UIColor.blue,
                                           NSAttributedStringKey.underlineColor.rawValue: UIColor.blue,
                                           NSAttributedStringKey.underlineStyle.rawValue: NSUnderlineStyle.styleSingle.rawValue]
            textView.attributedText = attributedString
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension TTViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        if let scheme = URL.scheme, let host = URL.host {
            if scheme == "tt" && host == "TTFeedbackViewController" {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let feedBackVC = storyboard.instantiateViewController(withIdentifier: FeedbackViewControllerIdentifier) as! TTFeedbackViewController
                navigationController?.pushViewController(feedBackVC, animated: true)
            }
        }
        return false
    }
}

