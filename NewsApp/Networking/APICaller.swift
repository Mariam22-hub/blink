
import Foundation
import UIKit
import Alamofire

public class APICaller {
    
    struct Constants{
        static let topHeadlinesURL = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2023-07-27&sortBy=publishedAt&apiKey=83bce6ac686e47058b204f5d0bb43628")
    }

    
    static func getTrendingMovies(completionHandler: @escaping (_ result: Result<News>) -> Void) {
        guard let url = Constants.topHeadlinesURL else {
            return
        }
        Alamofire.request(url, method: .get).validate().responseJSON { DataResponse in
            switch DataResponse.result{
            case .success:
                
                let json = DataResponse.data
                let result = try? JSONDecoder().decode(News.self, from: json!)
                completionHandler(.success(result!))

            case .failure(let error):
                completionHandler(.failure(error))
            }

        }
    }

}
