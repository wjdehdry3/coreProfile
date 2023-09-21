//
//  CoreDataViewController.swift
//  Profile
//
//  Created by 정동교 on 2023/09/22.
//

import UIKit
import CoreData

struct taskData: Codable, Equatable {
    let id: UUID?
    let title: String
    let createDate: Date?
    let modifyDate: Date?
    let isCompleted: Bool
}

class CoreDataViewController: UIViewController {
    
    @IBOutlet weak var coreTableView: UITableView!
    
    @IBAction func backButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
   
    
    override func viewDidLoad() {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ko_KR")
        
//        print(str[range].prefix(11))
        
     
        
        super.viewDidLoad()
        
        
        
    }
    @IBAction func creatButton(_ sender: Any) {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ko_KR")
        
        
        
        let alert = UIAlertController(title: "", message: "목록을 생성해보세요", preferredStyle: UIAlertController.Style.alert)
        
        alert.addTextField()
        
        let deleteAction = UIAlertAction(title: "생성", style: UIAlertAction.Style.destructive){(_) in
            let creatDa = taskData(id: UUID.init(), title: (alert.textFields?[0].text)!, createDate: datePicker.date, modifyDate: datePicker.date, isCompleted: false)
            CoreDataManager().insertEntity(creatDa)
            self.coreTableView.reloadData()
            print(CoreDataManager().getTask())
        }

        let cancelAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel, handler: nil)
        
        
        alert.addAction(cancelAction)
        alert.addAction(deleteAction)
        
        present(alert, animated: true)
    }
    

}

extension CoreDataViewController :UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CoreDataManager().getTask().count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let str = "\(String(describing: CoreDataManager().getTask()[index].createDate))"
        let startIndex = str.index(str.startIndex, offsetBy: 14)
        let range = startIndex...
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoreDataViewCell", for: indexPath) as! CoreDataViewCell
        
        
        
        cell.titleLabel.text  = CoreDataManager().getTask()[index].title
        cell.dateLabel.text = String(str[range].prefix(11))
        cell.switchButton.isOn = CoreDataManager().getTask()[index].isCompleted
       
        cell.switchButton.tag = indexPath.row
        cell.switchButton.addTarget(self, action: #selector(self.tSwitch(sender:)), for: .valueChanged)
        
        
        return cell
    }
    @objc func tSwitch (sender : UISwitch)  {
        
        let index = sender.tag

        CoreDataManager().updateSwitch(index)
        
        coreTableView.reloadSections(IndexSet(0...0), with: .automatic)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "", message: "삭제와 수정.", preferredStyle: UIAlertController.Style.alert)
        
        let deleteAction = UIAlertAction(title: "삭제", style: UIAlertAction.Style.destructive){(_) in
            CoreDataManager().deleteTask(indexPath.row)
            tableView.reloadData()
        }
        let updateAction =  UIAlertAction(title: "수정", style: UIAlertAction.Style.default){(_) in
            
            CoreDataManager().updateTask(indexPath.row, (alert.textFields?[0].text)!)
            tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel, handler: nil)
        
        alert.addTextField()
        alert.addAction(updateAction)
        alert.addAction(cancelAction)
        alert.addAction(deleteAction)
        
        present(alert, animated: true)
    }
    
    
}
