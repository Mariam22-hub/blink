

import UIKit
import SDWebImage

protocol tableViewCellDelegate{
    func sendDataToCells()
}

class TableViewCell: UITableViewCell {
    
    var DataSource: [cellViewModel] = []
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        newsImage.layer.cornerRadius = 3
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    public static func register() -> UINib{
        UINib(nibName: "TableViewCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var newsImage: UIImageView!{
        didSet{
            newsImage.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var newsTitleLabel: UILabel!{
        didSet{
            newsTitleLabel.numberOfLines = 0
            newsTitleLabel.adjustsFontSizeToFitWidth = true
            newsTitleLabel.minimumScaleFactor = 0.6
            newsTitleLabel.sizeToFit()
            
        }
    }
    
    @IBOutlet weak var newsPublishedAtLable: UILabel!{
        didSet{
            newsPublishedAtLable.sizeToFit()
        }
    }
    
    func setUpCell(viewModel: cellViewModel){
        self.newsTitleLabel.text = viewModel.title
        self.newsPublishedAtLable.text = viewModel.publishedAt
        self.newsImage.sd_setImage(with: viewModel.urlToImage)
    }
    
}
