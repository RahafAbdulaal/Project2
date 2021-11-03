//
//  CreditCardVC.swift
//  Arts
//
//  Created by Rahaf Abdulaal on 28/03/1443 AH.
//

import UIKit
struct Card {
    var CreditNum : String
    var NameOnCard : String
    var CCVNum : String
}
class CreditCardVC: UIViewController ,UITableViewDelegate , UITableViewDataSource, UpdateDelegate {
    
    
    var indexpath = 0
    var CardARR = [Card] ()
    var cardName = ""
    var ccvNum  = ""
    var cridetnum = ""
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "show_det")
        {
          let detailsVC = segue.destination as! detailsViewController
          detailsVC.delegate = self
            detailsVC.cardnumber = cridetnum
            detailsVC.cardName = cardName
            detailsVC.ccv = ccvNum
        }
    }
    
    func updateDetails(nameP: String,CCVP : String, cridtNumP :String){
        CardARR[indexpath].NameOnCard = nameP
        CardARR[indexpath].CCVNum = CCVP
        CardARR[indexpath].CreditNum = cridtNumP
        YourCards.reloadData()

        print("updated")
    }

   

    @IBOutlet weak var YourCards: UITableView!
    @IBOutlet weak var CreditNumber: UITextField!
    @IBOutlet weak var CreditName: UITextField!
    @IBOutlet weak var CCV: UITextField!
    
   
//     var ARR = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        YourCards.delegate = self
        YourCards.dataSource = self
    }
    @IBAction func EditCard(_ sender: Any) {
        YourCards.isEditing = !YourCards.isEditing
    }
    
    @IBAction func AddCard(_ sender: Any) {
        
        CardARR.append(Card(
            CreditNum: CreditNumber.text!,
            NameOnCard: CreditName.text!,
            CCVNum: CCV.text!
        ))
        print(CardARR)
        YourCards.reloadData()
        
//        if let cards = CreditName.text {
//        ARR.append(cards)
//        let path = IndexPath(row: ARR.count - 1 , section: 0)
//        YourCards.beginUpdates()
//        YourCards.insertRows(at: [path], with: .automatic)
//        YourCards.endUpdates()
//        CreditNumber.text = nil
//        CreditName.text = ""
//            CCV.text = nil
//    }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CardARR.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = YourCards.dequeueReusableCell(withIdentifier: "CardCell", for: indexPath)
        cell1.textLabel?.text = CardARR[indexPath.row].NameOnCard
        return cell1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexpath = indexPath.row
        cardName = CardARR[indexPath.row].NameOnCard
        cridetnum = CardARR[indexPath.row].CreditNum
        ccvNum = CardARR[indexPath.row].CCVNum
        print(cardName)
        print(cridetnum)
        print(ccvNum)

//        id = yourArray[indexPath.row].subscriptionID
//        name = yourArray[indexPath.row].subscriptionName
//        price = yourArray[indexPath.row].price
//        start_date = yourArray[indexPath.row].startDate
//        end_date = yourArray[indexPath.row].endDate
//        reminingDays = yourArray[indexPath.row].dayleft
//        yearOrMonth = yourArray[indexPath.row].monthOrYear
//        indexpath = indexPath.row
        performSegue(withIdentifier: "show_det", sender: self)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteCard = UIContextualAction(style: .destructive, title: "delete" ){ (Action, view, completionHandler) in
            self.CardARR.remove(at: indexPath.row)
            self.YourCards.beginUpdates()
            self.YourCards.deleteRows(at: [indexPath], with: .automatic)
            self.YourCards.endUpdates()
        }
        return UISwipeActionsConfiguration(actions: [deleteCard])
    }
//    func setupCell(CreditNum : Int ,NameOnCard : String ,CCVNum : Int){
//
//    }

}
