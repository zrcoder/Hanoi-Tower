//
//  BaseTableViewController.swift
//  iOSBaseProject
//
//  Created by admin on 16/8/29.
//  Copyright © 2016年 Ding. All rights reserved.
//

import UIKit

class BaseTableViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    let pageSize = 5
    var pageNumber = 1

    let tableView: UITableView = {
        let tableView = UITableView(frame: screenBounds, style: .plain)
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source.
    // Warning: - subclass should reimplement them.

    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
