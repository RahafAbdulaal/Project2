
import UIKit

protocol UpdateDelegate {
  func updateDetails(nameP: String,CCVP : String, cridtNumP :String)
}


class detailsViewController:
    UIViewController {
    var delegate: UpdateDelegate!

    var cardName = ""
    var cardnumber = ""
    var ccv = ""

    @IBOutlet weak var numberLable: UITextField!
    @IBOutlet weak var namelable: UITextField!
    @IBOutlet weak var ccvlable: UITextField!
    
    @IBAction func updateBtn(_ sender: Any) {
        
        delegate.updateDetails(
            nameP: namelable.text!,
            CCVP : ccvlable.text!,
            cridtNumP :numberLable.text!
         )
         navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        numberLable.text = cardnumber
        namelable.text = cardName
        ccvlable.text = ccv

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
