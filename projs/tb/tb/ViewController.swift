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
    
    fileprivate var items: [Poem] = [Poem]() {
        didSet {
            tableView.reloadData()
        }
    }

    
    
    
    lazy var tableView: NSTableView = {
        let tb = NSTableView(frame: .zero)
        tb.rowSizeStyle = .large
        tb.allowsColumnSelection = true
        tb.backgroundColor = .clear
        tb.delegate = self
        tb.dataSource = self
        let column = NSTableColumn(identifier: .column)
        tb.headerView = nil
        column.width = 1
        tb.addTableColumn(column)
        return tb
    }()
    
  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.frame = NSRect(x: 0, y: 0, width: 400, height: 250)
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
        
        let users = ["We are not now that strength which in old days",
                     "Moved earth and heaven, that which we are, we are;",
                     "One equal temper of heroic hearts,",
                     "Made weak by time and fate, but strong in will",
                     "To strive, to seek, to find, ",
                     "and not to yield"].map(Poem.init)
        add(items: users)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    
    func add(items: [Poem]) {
        self.items += items
    }
}





extension ViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard tableColumn?.identifier == NSUserInterfaceItemIdentifier.column else {
            fatalError("identifier not found")
            
        }
        
        let name = items[row].sentence
        let view = NSTextField(string: name)
        view.isEditable = false
        view.isBordered = false
        view.backgroundColor = .clear
        return view
    }
    
    
}
    
    
extension ViewController: NSTableViewDelegate {
    
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return heightOfRow
    }
    
    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: NSTableView, didClick tableColumn: NSTableColumn) {
        print("点击了 \(tableColumn)")
    }
    
    
    
    func tableView(_ tableView: NSTableView, rowActionsForRow row: Int, edge: NSTableView.RowActionEdge) -> [NSTableViewRowAction] {
        let rm = NSTableViewRowAction(style: NSTableViewRowAction.Style.destructive, title: "删", handler: { (action, idx) in
            
            
            
                                      })
        return [rm ]
    }
}
