

import UIKit
import Foundation
class ViewController: UIViewController {
     //step 1- create an outlets for label
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startStopButton: UIButton!
    //step-3 create a variable
    var timer: Timer?
    var isStarted = false
    var counter = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //step-5
    @objc func updateTimerLabel(){
        counter += 0.1
        timeLabel.text = String(round(counter*10)/10)
    }
    
    
    // step-2 create an Actions for buttons
    @IBAction func startStopDidTouch(_ sender: Any) {
        if isStarted{           //step-4
            timer?.invalidate()   //step -9
            isStarted = false       //step- 10
            startStopButton.setTitle("start", for: .normal)   //step- 11
            
            
            
            
        }else{
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector:#selector(updateTimerLabel) , userInfo: nil, repeats: true)//step-6 bcoz of selector have mentioned in step-5
            isStarted = true       //step- 7
            startStopButton.setTitle("Stop", for: .normal)   //step- 8
        }
    }
    @IBAction func resetDidTouch(_ sender: Any) {
        counter = 0.0
        timeLabel.text = "0.0"
        if isStarted{
            timer?.invalidate()
            startStopButton.setTitle("start", for: .normal)
            isStarted = false
            
        }
        
        
    }
}



