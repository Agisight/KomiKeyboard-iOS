

import UIKit

final class SymbolsManager {
  
  static func getImage(named name: String) -> UIImage {
    if #available(iOS 13, *) {
      return UIImage(systemName: name) ?? UIImage()
    } else {
      return UIImage(named: name) ?? UIImage()
    }
  }
  
}
