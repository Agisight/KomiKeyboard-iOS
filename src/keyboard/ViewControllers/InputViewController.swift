//
//  InputViewController.swift
//  ibepo
//
//  Created by Steve Gigou on 2020-05-02.
//  Copyright © 2020 Novesoft. All rights reserved.
//

import UIKit


// MARK: - InputViewControllerDelegate

/// Delegate protocol allowing to retrieve text CRUD.
protocol InputViewControllerDelegate: class {
  
  /// Text should be inserted.
  func insert(_ text: String)
  /// Delete one character backward
  func deleteBackward()
  /// Delete the given amount of characters backward.
  func deleteBackward(amount: Int)
  
}


// MARK: - InputViewController

/// Full keyboard view
final class InputViewController: UIViewController {
  
  /// Delegate that will get text CRUD.
  weak var delegate: InputViewControllerDelegate?
  
  /// The actual keyboard.
  private var keypadViewController: KeypadViewController?
  
  
  // MARK: Life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loadViews()
  }
  
  
  // MARK: Configuration
  
  /**
   Refresh document proxy values.
   */
  func update(textDocumentProxy: UITextDocumentProxy) {
    KeyboardSettings.shared.update(textDocumentProxy)
  }
  
  
  // MARK: Loading
  
  /**
   Load the key pad and the autocomplete view (if needed).
   */
  private func loadViews() {
    keypadViewController = KeypadViewController()
    keypadViewController!.delegate = self
    add(keypadViewController!, with: [
      keypadViewController!.view.topAnchor.constraint(equalTo: view.topAnchor),
      keypadViewController!.view.rightAnchor.constraint(equalTo: view.rightAnchor),
      keypadViewController!.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      keypadViewController!.view.leftAnchor.constraint(equalTo: view.leftAnchor)
    ])
  }
  
}


// MARK: - KeypadViewControllerDelegate

extension InputViewController: KeypadViewControllerDelegate {
  
  func insert(text: String) {
    delegate?.insert(text)
  }
  
  func deleteBackward() {
    delegate?.deleteBackward()
  }
  
  func deleteBackward(amount: Int) {
    delegate?.deleteBackward(amount: amount)
  }
  
}
