

import UIKit
import SDWebImage

class DetailsViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configController()
    }

    // IBoutlets
    
    @IBOutlet weak var newsImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!{
        didSet{
            descriptionLabel.numberOfLines = 0
            descriptionLabel.adjustsFontSizeToFitWidth = true
            descriptionLabel.sizeToFit()
        }
    }
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var publishedAtLabel: UILabel!
    
    @IBAction func webPageButton(_ sender: Any) {
        if let url = NSURL(string: "http://www.google.com"){
            UIApplication.shared.open(viewModel.url!)
         }
    }
    
    
    // view model
    var viewModel: detailsViewModel
    
    init(viewModel: detailsViewModel){
        self.viewModel = viewModel
        super.init(nibName: "DetailsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init code hasnt been impleneted")
    }
    
    
    // assigning labels to the values
    func configController(){
        self.title = "News Details"
        self.titleLabel.text = viewModel.title
        self.descriptionLabel.text = viewModel.description
        self.publishedAtLabel.text = viewModel.publishedAt
        self.authorLabel.text = viewModel.author
        
        newsImage.sd_setImage(with: viewModel.urlToImage)
    }

    
}
