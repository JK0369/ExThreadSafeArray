//
//  ViewController.swift
//  ExThreadSafeArray
//
//  Created by 김종권 on 2022/08/07.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let serialQueue1 = DispatchQueue(label: "serial1")
    let serialQueue2 = DispatchQueue(label: "serial2")
    serialQueue1.async {
      print("job 1")
    }
    serialQueue2.sync {
      print("job 2")
    }
    serialQueue1.async {
      print("job 3")
    }
    serialQueue2.sync {
      print("job 4")
    }
    serialQueue1.async {
      print("job 5")
    }
    serialQueue2.sync {
      print("job 6")
    }
    serialQueue1.async {
      print("job 7")
    }
    serialQueue2.sync {
      print("job 8")
    } 
  }
}

final class ThreadSafeArray<T> {
  private var array = [T]()
  private let queue = DispatchQueue(label: "Thread Safe Array", attributes: .concurrent)
}

// Operator
extension ThreadSafeArray {
  func first() -> T? {
    self.array.first
  }
  
  func removeLast() -> T? {
    guard !self.array.isEmpty else { return nil }
    return self.array.remove(at: self.array.count - 1)
  }
}
