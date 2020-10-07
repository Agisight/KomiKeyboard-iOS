


protocol TextModifier {
  
  func modify()
  func deletionOccured()
  func moveOccured()
  
}


struct TextModifierSet {
  
  let modifiers: [TextModifier]
  
  init(modifiers: [TextModifier]) {
    self.modifiers = modifiers
  }
  
  func modify() {
    for modifier in modifiers {
      modifier.modify()
    }
  }
  
  func deletionOccured() {
    for modifier in modifiers {
      modifier.deletionOccured()
    }
  }
  
  func moveOccured() {
    for modifier in modifiers {
      modifier.moveOccured()
    }
  }
  
}
