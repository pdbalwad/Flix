//
//  moviesCell.swift
//  Flix
//
//  Created by Priyanka Balwadkar on 9/22/20.
//

import UIKit

class moviesCell: UITableViewCell {

    @IBOutlet weak var movieTitleLabel: UILabel!
    
   
    @IBOutlet weak var movieOverviewLabel: UILabel!
    
    @IBOutlet weak var moviePosterView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
