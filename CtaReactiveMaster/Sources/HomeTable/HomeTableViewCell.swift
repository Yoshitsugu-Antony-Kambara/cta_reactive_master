//
//  HomeTableViewCell.swift
//  CtaReactiveMaster
//
//  Created by 神原良継 on 2020/12/03.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCell(news: News) {
        self.title.text = news.title as String
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
