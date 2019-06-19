//
//  MainViewController.swift
//  clipper
//
//  Created by Wayne Irwin on 18/6/19.
//  Copyright © 2019 Wayne Irwin. All rights reserved.
//

import Foundation

class MainViewContoller: NSViewController{
    
    @IBOutlet weak var tableView: NSTableView!
    var _datastore:Datastore!
    
    override func viewDidAppear() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(newDataCallBack), name: .newDataAdded, object: nil)
    }

    
    @objc func newDataCallBack(){
        self.tableView.reloadData()
    }
    
        override func loadView() {
            super.loadView()
        }
    
}


extension MainViewContoller: NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        if(self._datastore != nil){
            return self._datastore.numOfItems()
        }
        return 0
    }
    
}

extension MainViewContoller: NSTableViewDelegate {
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let result:NSTableCellView = self.tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "defaultRow"), owner: self) as! NSTableCellView
        result.textField?.stringValue = self._datastore.data[row]
        return result
        
        
    }
    
    
    override func keyDown(with event: NSEvent) {
        
        if (event.characters == "\r") {
            let select_row: Int = tableView.selectedRow
            let selected_data: Data? = self._datastore.data[select_row].data(using: .utf8)
            let pasteboard: NSPasteboard = .general
            pasteboard.clearContents()
            pasteboard.setData(selected_data, forType: .string)
        }
        
        
    }
    
    
    
    
    
    
    
    
    
}
