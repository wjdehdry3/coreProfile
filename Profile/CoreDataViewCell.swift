//
//  CoreDataViewCell.swift
//  Profile
//
//  Created by 정동교 on 2023/09/22.
//

import UIKit


class CoreDataViewCell: UITableViewCell {
    
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
