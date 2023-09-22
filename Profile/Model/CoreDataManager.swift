//
//  CoreDataManager.swift
//  Profile
//
//  Created by 정동교 on 2023/09/22.
//

import CoreData
import Foundation
import UIKit

class CoreDataManager {
    static var shared: CoreDataManager = CoreDataManager()
    
    // Persistent container를 생성
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Task")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    // context 가져오기
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    // Entity 가져오기
    var TaskEntity: NSEntityDescription? {
        return  NSEntityDescription.entity(forEntityName: "Task", in: context)
    }
    // managedObject를 생성하고 Task의 요소를 세팅한다
    func insertEntity(_ notice: taskData) {
        if let entity = TaskEntity {
            let manag = NSManagedObject(entity: entity, insertInto: context)
            manag.setValue(notice.id, forKey: "id")
            manag.setValue(notice.title, forKey: "title")
            manag.setValue(notice.createDate, forKey: "createDate")
            manag.setValue(notice.modifyDate, forKey: "modifyDate")
            manag.setValue(notice.isCompleted, forKey: "isCompleted")
            
            saveToContext()
        }
    }
    // context를 저장하는 함수
    func saveToContext() {
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    //Read기능 구현을 위한 저장된 데이터를 fatch 해오는 함수
    func fetchTask() -> [Task] {
        do {
            let request = Task.fetchRequest()
            let results = try context.fetch(request)
            return results
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
    // 위엣놈 데이터 쓰기 힘드니까 구조체에 데이터 맞추기
    func getTask() -> [taskData] {
        var notices: [taskData] = []
        let fetchResults = fetchTask()
        for result in fetchResults {
            let notice = taskData(id: result.id, title: result.title ?? "", createDate: result.createDate , modifyDate: result.modifyDate, isCompleted: result.isCompleted)
            notices.append(notice)
        }
        return notices
    }
    // 업데이트 기능
    func updateTask(_ index: Int , _ tex: String) {
        let fetchResults = fetchTask()
        for result in fetchResults {
            if result.id == getTask()[index].id {
                let datePicker = UIDatePicker()
                datePicker.datePickerMode = .date
                datePicker.locale = Locale(identifier: "ko_KR")
                result.title = tex
                result.modifyDate = datePicker.date
            }
        }
        saveToContext()
    }
    // 앤 스위치 업데이트 기능
    func updateSwitch(_ index: Int) {
        let fetchResults = fetchTask()
        for result in fetchResults {
            if result.id == getTask()[index].id {
                result.isCompleted = !result.isCompleted
            }
        }
        print(getTask()[index].isCompleted)
        saveToContext()
    }
    // 삭제기능
    func deleteTask(_ index: Int) {
        let fetchResults = fetchTask()
        let notice = fetchResults[index]
        context.delete(notice)
        saveToContext()
    }
}
