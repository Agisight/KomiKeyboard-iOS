

import UIKit

class InstallViewController: UIViewController {

  @IBAction func onSettingsTap() {
    guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
      return
    }
    if UIApplication.shared.canOpenURL(settingsUrl) {
      UIApplication.shared.openURL(settingsUrl)
    }
  }

    
    
}

