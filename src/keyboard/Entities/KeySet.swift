

import Foundation


// MARK: - typealias KeyCoordinate

typealias KeyCoordinate = (row: Int, col: Int)


// MARK: - typealias Row

typealias Row = [Key]


// MARK: - struct KeySet

struct KeySet {
  
  let rows: [Row]
  
  var keys: [Key] {
    var keys = [Key]()
    for row in rows {
      keys.append(contentsOf: row)
    }
    return keys
  }
  
  // MARK: Key finding
  
  func key(at coordinate: KeyCoordinate) -> Key {
    let row = rows[coordinate.row]
    let key = row[coordinate.col]
    return key
  }
  
}
