//


import Foundation

protocol MainViewModelDelegate{
    func passNewsToCells(newsList: [cellViewModel])
    func passNewsToDetailsVC(newsDetails: NewsListModel)
}


class MainViewModel {
    
    // data coming from the api handler
    var dataSource: News?
    
    var delegate: MainViewModelDelegate?

    
    func numberOfRows(in section: Int) -> Int {
        return dataSource?.articles.count ?? 0
    }
    
    func getData() {

        APICaller.getTrendingMovies { [weak self] result in

            switch result {
            case .success(let articles):

                self?.dataSource = articles
//                print(self?.dataSource?.articles)
                self?.mapMovieData()

            case .failure(let err):
                print(err)
            }
        }
        
        
    }
    
    private func mapMovieData() {
        self.delegate?.passNewsToCells(newsList: self.dataSource?.articles.compactMap({cellViewModel(news: $0)}) ?? [])
    }

    
    func getNews(by title: String){
        guard let news = dataSource?.articles.first(where: {$0.title == title}) else {
            return
        }
        self.delegate?.passNewsToDetailsVC(newsDetails: news)
    }
    
}
