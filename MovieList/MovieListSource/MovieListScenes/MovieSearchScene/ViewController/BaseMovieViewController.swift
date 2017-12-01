//
//  BaseMovieViewController.swift
//  TestApp
//
//  Created by Dev on 11/27/17..
//  Copyright © 2017 Fazeel. All rights reserved.
//

import UIKit
import  Cartography

class BaseViewController <  T , Cell :  BaseMovieItemCell < T > >  : UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    /**
        Generic Type Table Data for display Cells
     */
    var mTableData :  Array<Any>
    
    
    /**
        Generic Type Table ViewCell Type
     */
    
    typealias mCell = Cell
    
    
    /**
     Lazy Table View with Generic Type Table ViewCell Type
     */
    
    
    lazy var tableView : UITableView = {
        let tableView = UITableView(frame: .zero , style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight =  UITableViewAutomaticDimension
        return tableView
    }()
    
    
    
    
    /**
        REQUIRED initializer
     */
    
    
    required init?(coder: NSCoder) {
        mTableData = []
        super.init(coder: coder)
    }
    
    
    
    init() {
        mTableData = []
        super.init(nibName: nil, bundle: nil)
    }
    
    
    
    override  func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.addSubview(tableView)
        tableView.register(cell: mCell.self)
        tableView.reloadData()
        // Add loading indicator
        
        constrain( self.view , tableView , block: { (superView, subView) in
            subView.leading == superView.leading
            subView.trailing == superView.trailing
            subView.top == superView.top
            subView.bottom == superView.bottom
        })
    }
    
    
    
    /**
        Table view Delegates    :   unable to make extention due to swift generic constraint
     
     */
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mTableData.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(with: mCell.self) {
            if  let model = self.mTableData[indexPath.row] as?  mCell.T {
                cell.configure(model , at: indexPath)
            }
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            tableView.tableFooterView?.isHidden  = true
    }
    
    
}


extension BaseViewController {
  
    
    
    /**
     
        ddFooterLoadingAnimatio    :   Loading next Page Animation at footer
     
     */
    
    func addFooterLoadingAnimation(){
        let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
        spinner.startAnimating()
        tableView.tableFooterView = spinner
        tableView.tableFooterView?.isHidden = false
    }
}
