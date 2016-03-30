# waterbalance
waterbalance

#import "VoteView.h"
#import "QCMethod.h"

@IBOutlet var voteview: VoteView!


@IBAction func animation(sender: UIButton) {
     
        voteview.startAllAnimationsWithFraction(0.35)
    }
    @IBAction func new3(sender: UIButton) {
        voteview.startAllAnimationsWithFraction(0.77)
    }

    @IBAction func new1(sender: UIButton) {
        
        voteview.startAllAnimationsWithFraction(0.48)
    }
