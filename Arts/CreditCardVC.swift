//
//  CreditCardVC.swift
//  Arts
//
//  Created by Rahaf Abdulaal on 28/03/1443 AH.
//

import UIKit

class CreditCardVC: UIViewController ,UITableViewDelegate , UITableViewDataSource {
   
    @IBOutlet weak var YourCards: UITableView!
    @IBOutlet weak var CreditNumber: UITextField!
    @IBOutlet weak var CreditName: UITextField!
    @IBOutlet weak var CCV: UITextField!
   // var CardARR = [Card] ()
    var ARR = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        YourCards.delegate = self
        YourCards.dataSource = self
    }
    @IBAction func EditCard(_ sender: Any) {
        YourCards.isEditing = !YourCards.isEditing
    }
    
    @IBAction func AddCard(_ sender: Any) {
        if let cards = CreditName.text {
        ARR.append(cards)
        let path = IndexPath(row: ARR.count - 1 , section: 0)
        YourCards.beginUpdates()
        YourCards.insertRows(at: [path], with: .automatic)
        YourCards.endUpdates()
        CreditNumber.text = nil
        CreditName.text = ""
        CCV.text = nil
    }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ARR.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = YourCards.dequeueReusableCell(withIdentifier: "CardCell", for: indexPath)
        cell1.textLabel?.text = ARR[indexPath.row]
        return cell1
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteCard = UIContextualAction(style: .destructive, title: "delete" ){ (Action, view, completionHandler) in
            self.ARR.remove(at: indexPath.row)
            self.YourCards.beginUpdates()
            self.YourCards.deleteRows(at: [indexPath], with: .automatic)
            self.YourCards.endUpdates()
        }
        return UISwipeActionsConfiguration(actions: [deleteCard])
    }
}
//    func setupCell(CreditNum : Int ,NameOnCard : String ,CCVNum : Int){
//
//    }
//struct Card {
//    let CreditNum : Int
//    let NameOnCard : String
//    let CCVNum : Int
//}
