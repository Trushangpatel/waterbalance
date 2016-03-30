

import UIKit


class ViewController: UIViewController {
 
    @IBOutlet var voteview: VoteView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

    @IBAction func animation(sender: UIButton) {
     
        voteview.startAllAnimationsWithFraction(0.35)
    }
    @IBAction func new3(sender: UIButton) {
        voteview.startAllAnimationsWithFraction(0.77)
    }

    @IBAction func new1(sender: UIButton) {
        
        voteview.startAllAnimationsWithFraction(0.48)
    }

    
}

