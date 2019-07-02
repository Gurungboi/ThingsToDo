//
//  HomeViewController.swift
//  ThingsToDo
//
//  Created by Sunil Gurung on 23/6/19.
//  Copyright © 2019 Sunil Gurung. All rights reserved.
//

import UIKit
import CoreData
class HomeViewController: UIViewController {

    var backupData = [BackupObject]()
    var fetchBackupData = DBHelper().fetch(entityName: "UserEntity")
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
    }
    override func viewDidAppear(_ animated: Bool) {
        //self.navigationController?.isNavigationBarHidden = false;
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    @IBAction func btnAdd(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let addVC = storyBoard.instantiateViewController(withIdentifier: "addVC") as! AddViewController
        self.navigationController?.pushViewController(addVC, animated: true)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return backupData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HomeTableViewCell{
            let backup = backupData[indexPath.row]
            DispatchQueue.global(qos: .userInitiated).async {
                cell.lblName.text = backup.name
                cell.lblAddress.text = backup.address
            }
            return cell
        }else {
            return UITableViewCell()
        }
    }
    
    
}
