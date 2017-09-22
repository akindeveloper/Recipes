//
//  ViewController.swift
//  RecipePuppy
//
//  Created by ukgroupe on 9/21/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var recipes = [Information]()
    
    struct Information {
        let ginger : String
        let potato : String
        let eggnog: String
        let pork : String
        let irish : String
        let thumbprints : String
        let pasta : String
        let cider : String
        let cola : String
        let chicken : String
    }

    

    @IBOutlet var searchbar: UISearchBar!
    @IBOutlet var table: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "http://www.recipepuppy.com/api/")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print("error")
                
            }else{
                if let urldata = data{
                    do{
                        
                    let jsondata = try JSONSerialization.jsonObject(with: urldata, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                        
                        let ginger = (((jsondata["results"]as? NSArray)?[0] as? NSDictionary)?["title"] as? String)
                        let potato = (((jsondata["results"]as? NSArray)?[1] as? NSDictionary)?["title"] as? String)
                        let eggnog = (((jsondata["results"]as? NSArray)?[2] as? NSDictionary)?["title"] as? String)
                        let pork = (((jsondata["results"]as? NSArray)?[3] as? NSDictionary)?["title"] as? String)
                        let irish = (((jsondata["results"]as? NSArray)?[4] as? NSDictionary)?["title"] as? String)
                        let thumbprints = (((jsondata["results"]as? NSArray)?[5] as? NSDictionary)?["title"] as? String)
                        let pasta = (((jsondata["results"]as? NSArray)?[6] as? NSDictionary)?["title"] as? String)
                        let cider = (((jsondata["results"]as? NSArray)?[7] as? NSDictionary)?["title"] as? String)
                        let cola = (((jsondata["results"]as? NSArray)?[8] as? NSDictionary)?["title"] as? String)
                        let chicken = (((jsondata["results"]as? NSArray)?[9] as? NSDictionary)?["title"] as? String)
                        let info = Information(ginger:ginger!, potato:potato!, eggnog:eggnog!, pork:pork!, irish:irish!, thumbprints:thumbprints!, pasta:pasta!, cider:cider!, cola:cola!, chicken:chicken!)
                        
                        self.recipes.append(info)
                        
                         DispatchQueue.main.async(execute: {
                            print(jsondata)
                        })
                        
                        
                    }catch{
                        
                        // Error handling here
                    }
                    
                }
                
            }
        }
        task.resume()
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

