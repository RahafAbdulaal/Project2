//
//  UpdateAccountViewController.swift
//  Arts
//
//  Created by Rahaf Abdulaal on 27/03/1443 AH.
//

import UIKit

class UpdateAccountViewController: UIViewController {

    @IBOutlet weak var EditUserName: UITextField!
    
    @IBOutlet weak var EditEmail: UITextField!
    
    @IBOutlet weak var UpdatePhone: UITextField!
    
    @IBAction func Update(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let personalClass = segue.destination as! personalInfoViewController
        personalClass.username.text = EditUserName.text
        personalClass.email.text = EditEmail.text
        personalClass.phone.text = UpdatePhone.text

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
