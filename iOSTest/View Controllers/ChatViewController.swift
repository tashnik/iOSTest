//
//  ChatViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  /**
   * =========================================================================================
   * INSTRUCTIONS
   * =========================================================================================
   * 1) Make the UI look like it does in the mock-up.
   *
   * 2) Using the following endpoint, fetch chat data
   *    URL: http://dev.rapptrlabs.com/Tests/scripts/chat_log.php
   *
   * 3) Parse the chat data using 'Message' model
   *
   **/
  
  // MARK: - Properties
  private var client: ChatClient?
  //    private var messages: [Message]?
  private var messages: [UserMessage]?
  // MARK: - Outlets
  @IBOutlet weak var chatTable: UITableView!
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    //        messages = [Message]()
    messages = [UserMessage]()
    configureTable(tableView: chatTable)
    
    title = "Chat"
    
    getChats()
    
  }
  
  // MARK: - Private
  private func configureTable(tableView: UITableView) {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatTableViewCell")
    tableView.tableFooterView = UIView(frame: .zero)
    tableView.separatorStyle = .none
    tableView.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 36)
    if #available(iOS 13.0, *) {
      tableView.layer.backgroundColor = CGColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1.0)
    } else {
      // Fallback on earlier versions
    }
  }
  
  // MARK: - UITableViewDataSource
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell: ChatTableViewCell? = nil
    if cell == nil {
      let nibs = Bundle.main.loadNibNamed("ChatTableViewCell", owner: self, options: nil)
      cell = nibs?[0] as? ChatTableViewCell
    }
    
    cell?.setCellData(message: self.messages![indexPath.row])
    
    return cell!
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return messages!.count
  }
  
  // MARK: - UITableViewDelegate
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 130.0
  }
  
  // MARK: - IBAction
  @IBAction func backAction(_ sender: Any) {
    let mainMenuViewController = MenuViewController()
    self.navigationController?.pushViewController(mainMenuViewController, animated: true)
  }
  
  
  func getChats() {
    
    NetworkManager.shared.downloadUserMessages { [weak self] result, time in
      guard let self = self else { return }
      
      switch result {
      
      case .success(let chats):
       
      self.messages = chats
        DispatchQueue.main.async {
          self.chatTable.reloadData()
        }
        
      case .failure(let error):
        print(error.rawValue)
      }
    }
  }
}
