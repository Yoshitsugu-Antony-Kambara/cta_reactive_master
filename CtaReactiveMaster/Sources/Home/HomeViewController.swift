//
//  HomeViewController.swift
//  CtaReactiveMaster
//
//  Created by Takuma Osada on 2020/11/21.
//

import UIKit
import Alamofire

final class HomeViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    
    var articles: [Article] = []
    var url: String!
    var country: String = "us"
    fileprivate let refreshCtl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("start")
        table.dataSource = self
        table.delegate = self
        table.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        table.rowHeight = 50
        getArticles()
    }

    func getArticles() {
        AF.request("https://newsapi.org/v2/top-headlines?country=\(country)&apiKey=\(KeyManager().getValue(key: "APIkey"))")
            .response{(response) in
                guard let json = response.data else { return }
                //try!だと、壊れたjosnが返ってきたときにクラッシュしちゃうから、try catch に変えた方がいいのかも...
                let rest: Res = try! JSONDecoder().decode(Res.self, from: json)
                self.articles = rest.articles
                self.table.reloadData()
            }
    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return articles.count
      }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath ) as! HomeTableViewCell
        cell.textLabel?.text = articles[indexPath.row].title
        //cell.imageView?.image = UIImage(named: articles[indexPath.row].urlToImage)
        //print(articles[indexPath.row].urlToImage)
        
        return cell
    }
      
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        url = articles[indexPath.row].url
        
        let next = WebViewController()
        next.urlString = url                            //値渡し
        present(next, animated: true, completion: nil)  //画面遷移
    }
}
