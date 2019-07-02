//
//  AddViewController.swift
//  ThingsToDo
//
//  Created by Sunil Gurung on 23/6/19.
//  Copyright © 2019 Sunil Gurung. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    @IBAction func btnSave(_ sender: Any) {
        let name = txtName.text as! String
        let address = txtAddress.text as! String
        let result = [name,address] as NSArray
        if name.isEmpty{
            displayMyAlertMessage(title: "Error",userMessage: "Enter Your Name")
        } else if address.isEmpty{
            displayMyAlertMessage(title: "Error",userMessage: "Enter Your Address")
        } else {
            DBHelper().insert(entityName: "UserEntity", name: name, address: address)
            //DBHelper().insert(jsondata: result, entityName: "DataEntity")
            clear()
        }
    }
    func clear(){
        displayMyAlertMessage(title:"Saved",userMessage: "Done")
        txtName.text = ""
        txtAddress.text = ""
    }
    func displayMyAlertMessage(title: String, userMessage:String){
        let myAlert = UIAlertController(title: title, message: userMessage, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
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
