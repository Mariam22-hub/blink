
import Foundation

protocol DetailsViewModelDelegate{
    func sendDataToDetailsVC(newsList: NewsListModel, viewModel: detailsViewModel)
}


class detailsViewModel{
    
    var newList: NewsListModel
    
    var title: String?
    var publishedAt: String?
    var urlToImage: URL?
    var description: String
    var author: String
    var url: URL?
    
    var delegate: DetailsViewModelDelegate?
    
    init(newsList: NewsListModel){
        self.newList = newsList
        
        self.description = newList.description ?? ""
        self.publishedAt = newList.publishedAt
        self.title = newList.title ?? ""
        self.author = newsList.author ?? ""
        self.urlToImage = URL(string: newList.urlToImage ?? "")
        self.url = newsList.url
        
        self.delegate?.sendDataToDetailsVC(newsList: newsList, viewModel: self)
        
    }
}
