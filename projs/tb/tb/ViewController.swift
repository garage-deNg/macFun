//
//  ViewController.swift
//  tb
//
//  Created by Jz D on 2020/3/1.
//  Copyright © 2020 Jz D. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    
    let column = "column"
    let heightOfRow: CGFloat = 26
    
    fileprivate var items: [User] = [User]() {
        didSet {
            tableView.reloadData()
        }
    }

    
    
    
    lazy var tableView: NSTableView = {
        let tb = NSTableView(frame: .zero)
        tb.rowSizeStyle = .large
        tb.backgroundColor = .clear
        tb.delegate = self
        tb.dataSource = self
        let column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(rawValue: "column"))
        tb.headerView = nil
        column.width = 1
        tb.addTableColumn(column)
        return tb
    }()
    
  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.frame = NSRect(x: 0, y: 0, width: 200, height: 200)
        let scrollBaseView = NSScrollView()
        // Do any additional setup after loading the view.
        scrollBaseView.documentView = tableView
        view.addSubview(scrollBaseView)
        scrollBaseView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(  [scrollBaseView.topAnchor.constraint(equalTo: view.topAnchor),
                                     scrollBaseView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     scrollBaseView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     scrollBaseView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                                    ] )
        configureTableView()
    }
    
    
    func configureTableView() {
        
        let users = [User(name: "Alberto"),
                     User(name: "Felipe"),
                     User(name: "Aaron"),
                     User(name: "Laura"),
                     User(name: "Giuseppe")]
        add(items: users)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    
    func add(items: [User]) {
        self.items += items
    }
}





extension ViewController: NSTableViewDelegate, NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard (tableColumn?.identifier)!.rawValue == column else { fatalError("AdapterTableView identifier not found") }
        
        let name = items[row].name
        let view = NSTextField(string: name)
        view.isEditable = false
        view.isBordered = false
        view.backgroundColor = .clear
        return view
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return heightOfRow
    }
    
    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        return true
    }
}
