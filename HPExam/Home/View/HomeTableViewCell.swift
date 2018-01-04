//
//  HomeTableViewCell.swift
//  HPExam
//
//  Created by 雅风 on 2017/12/10.
//  Copyright © 2017年 yafeng. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var cell_image: UIImageView!
    
    @IBOutlet weak var cell_title: UILabel!
    @IBOutlet weak var cell_content: UILabel!
    @IBAction func cell_check(_ sender: Any) {
    }
    @IBAction func cell_do(_ sender: Any) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //设置cell是有圆角边框显示
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
