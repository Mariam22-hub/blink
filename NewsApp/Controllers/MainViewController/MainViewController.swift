

import UIKit

class MainViewController: UIViewController, MainViewModelDelegate {
  
    //IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //ViewModel
    var viewModel: MainViewModel = MainViewModel()
    
    //data to be sent to the cells
    var DataSource: [cellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
        viewModel.delegate = self
        viewModel.getData()
        
    }
    
    func configView() {
        self.title = "News"
        self.view.backgroundColor = .systemBackground
        
        self.setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
// using dependency injection to create the details view model and controller
    func openDetails (newsTitle: String){
        print("in open details")
        viewModel.getNews(by: newsTitle)
    }
    
    // delegate function from the view model
    func passNewsToCells(newsList: [cellViewModel]) {
        self.DataSource = newsList
        self.reloadTableView()
    }
    
    // delegate function from the view model
    func passNewsToDetailsVC(newsDetails: NewsListModel) {
        print("in delegate ")
        let detailsViewModel = detailsViewModel(newsList: newsDetails)
        let detailsController = DetailsViewController(viewModel: detailsViewModel)

        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detailsController, animated: true)
        }
    }
    
}



extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = .clear
        
        self.registerCells()
    }
    
    // A UI related function so its vital to make sure its in the main thread
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func registerCells() {
        self.tableView.register(TableViewCell.register(), forCellReuseIdentifier: "NewsCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.activityIndicator.stopAnimating()
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? TableViewCell else{
            return UITableViewCell()
        }
        
        let cellViewModel = DataSource[indexPath.row]
        cell.setUpCell(viewModel: cellViewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsTitle = self.DataSource[indexPath.row].title
        print("in the did select row at")
        self.openDetails(newsTitle: newsTitle!)
    }

}

