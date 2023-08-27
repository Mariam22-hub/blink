//
//  cellViewModel.swift
//  MovieDetailsMVVM
//
//  Created by Blink22 User on 25/08/2023.
//

import Foundation


class cellViewModel{
    
    var title: String?
    var publishedAt: String?
    var urlToImage: URL?
    
    init(news: NewsListModel){
        self.title = news.title
        self.publishedAt = news.publishedAt
        self.urlToImage = URL(string: news.urlToImage ?? "")
    }

}
