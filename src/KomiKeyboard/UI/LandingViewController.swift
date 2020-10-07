

import UIKit

class LandingViewController: UITableViewController {

  enum Sections: Int, CaseIterable {
    case tools, help, links, contact
  }

  // MARK: Life cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.tableHeaderView = Bundle.main.loadNibNamed("LandingHeaderView", owner: nil, options: nil)?.first as? UIView
    let backButton = UIBarButtonItem()
    backButton.title = ""
    self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    navigationController?.setNavigationBarHidden(true, animated: animated)
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.setNavigationBarHidden(false, animated: animated)
  }

  // MARK: Table view data source

  override func numberOfSections(in tableView: UITableView) -> Int {
    return Sections.allCases.count
  }

  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    switch section {
    case Sections.tools.rawValue: return "Видлалӧм"
    case Sections.help.rawValue: return "Отсӧг"
    case Sections.links.rawValue: return "Ыстӧгъяс"
    case Sections.contact.rawValue: return "Йитчӧм"
    default: return ""
    }
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case Sections.tools.rawValue: return 1 // völi 1
    case Sections.help.rawValue: return 1 // völi 2
    case Sections.links.rawValue: return 1 // völi 2
    case Sections.contact.rawValue: return 1
    default: return 0
    }
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
    switch indexPath.section {
    case Sections.tools.rawValue:
      configure(cell, title: "Видлыны личкӧдулов", imageName: "command")
    case Sections.help.rawValue:
      switch indexPath.row {
      case 0: configure(cell, title: "Сувтӧдӧм (Установка)", imageName: "settings")
    //  case 1: configure(cell, title: "Бала", imageName: "book-open")
      default: break
      }
    case Sections.links.rawValue:
      switch indexPath.row {
      case 0: configure(cell, title: "Сайт", imageName: "globe")
    //  case 1: configure(cell, title: "github", imageName: "github")
      default: break
      }
    case Sections.contact.rawValue:
      configure(cell, title: "Йитчыны вӧчыськӧд", imageName: "vk")
    default:
      break
    }
    return cell
  }

  private func configure(_ cell: UITableViewCell, title: String, imageName: String) {
    cell.textLabel?.text = title
    cell.imageView?.image = UIImage(named: imageName)
    if #available(iOS 13.0, *) {
      cell.imageView?.tintColor = .tertiaryLabel
    } else {
      cell.imageView?.tintColor = .systemGray
    }
  }

  // MARK: User interaction

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch indexPath.section {
    case Sections.tools.rawValue: open(segue: "editor")
    case Sections.help.rawValue:
      switch indexPath.row {
      case 0: open(segue: "install")
      case 1: open(url: "https://github.com/")
      default: break
      }
    case Sections.links.rawValue:
      switch indexPath.row {
      case 0: open(url: "https://majbyr.com")
      case 1: open(url: "https://github.com/")
      default: break
      }
    case Sections.contact.rawValue: open(url: "https://vk.com/alexthesun")
    default: break
    }
  }

  private func open(url destination: String) {
    guard let url = URL(string: destination) else { return }
    if UIApplication.shared.canOpenURL(url) {
      UIApplication.shared.openURL(url)
    }
  }

  private func open(segue identifier: String) {
    performSegue(withIdentifier: identifier, sender: self)
  }

}
