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
    // Do any additional setup after loading the view.
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
