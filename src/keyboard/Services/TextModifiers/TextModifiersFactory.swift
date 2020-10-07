


final class TextModifiersFactory {
  
  static func generate(for delegate: KeyboardActionProtocol) -> TextModifierSet {
    return TextModifierSet(modifiers: [
      DotInserter(delegate),
      SpaceRemover(delegate),
      NonBreakingSpaceInserter(delegate)
    ])
  }
  
}
