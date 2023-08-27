//
//  TableModel.swift
//  NewsAppMVVM
//
//  Created by Blink22 User on 24/08/2023.
//

import Foundation


struct NewsListModel: Codable {
    
    var title: String?
    var publishedAt: String
    let description: String?
    var urlToImage: String?
    var url: URL?
    var author: String?

}

struct News: Codable{
    var articles: [NewsListModel]
}
