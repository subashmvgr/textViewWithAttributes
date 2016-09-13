//  Copyright © 2016 Subash Dantuluri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var texView: UITextView!
    @IBOutlet weak var texField: UITextView!
    
    override func viewDidLoad() {
      super.viewDidLoad()
    }
    
    @IBAction func submit(sender: AnyObject) {
        let message = texField.text.stringByReplacingOccurrencesOfString("\n", withString:"<br>")
        
        do {
            texView?.attributedText = message.dataUsingEncoding(NSUTF8StringEncoding).flatMap { data -> NSMutableAttributedString? in
                guard let string = try? NSMutableAttributedString(data: data, options: [
                    NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                    NSCharacterEncodingDocumentAttribute : NSUTF8StringEncoding
                    ], documentAttributes: nil) else { return nil }
                return string
            }
        }
        
    }
}


//Try strings like
// "<i>Thank you for waiting.</i>"
// "<u>Thank you for waiting.</u>"
// "<b>Thank you for waiting.</b>"
