//
//  KeySetFactory.swift
//  ibepo
//
//  Created by Steve Gigou on 2020-05-04.
//  Copyright © 2020 Novesoft. All rights reserved.
//  Copyright © 2020 majbyr.com. All rights reserved.
//

final class KeySetFactory {
  
  func generate() -> KeySet {
    var rows = [Row]()
    rows.append(generateRow1())
    rows.append(generateRow2())
    rows.append(generateRow3())
    return KeySet(rows: rows)
  }
  
private func generateRow1() -> Row {
    var row = Row()
    row.append(generateKey(for: KeyCharacterSet("й", nil, ["й","1"], "1", nil, ["1","¹"]))) //völi .level: .secondary
    row.append(generateKey(for: KeyCharacterSet("ц", nil, ["ц","2"], "2", nil, ["2","½","²"])))
    row.append(generateKey(for: KeyCharacterSet("у", nil, ["у","3"], "3", nil, ["3","³"])))
    row.append(generateKey(for: KeyCharacterSet("к", nil, ["к","4"], "4", nil, ["4","¼","¾"])))
    row.append(generateKey(for: KeyCharacterSet("е", nil, ["ё","е","5"], "5", nil, nil)))
    row.append(generateKey(for: KeyCharacterSet("н", nil, ["н","6"], "6", nil, nil)))
    row.append(generateKey(for: KeyCharacterSet("г", nil, ["г","7"], "7", nil, nil)))
    row.append(generateKey(for: KeyCharacterSet("ш", nil, ["щ","ш","8"], "8", nil, nil)))
    row.append(generateKey(for: KeyCharacterSet("щ", nil, ["ш","щ","9"], "9", nil, nil)))
    row.append(generateKey(for: KeyCharacterSet("з", nil, ["з","0"], "0", nil, nil)))
    row.append(generateKey(for: KeyCharacterSet("х", nil, ["«","х"], "«", nil, ["{","»","["])))
    row.append(generateKey(for: KeyCharacterSet("і", nil, ["»","і"], "»", nil, ["}","]","»"])))

    return row
  }
  
  private func generateRow2() -> Row {
    var row = Row()
    row.append(generateKey(for: KeyCharacterSet("ф", nil, ["ф","#","№"], "#", nil, ["#","ф","№"]), level: .secondary))
    row.append(generateKey(for: KeyCharacterSet("ы", nil, ["ы","/"], "/", nil, ["ы","ц"])))
    row.append(generateKey(for: KeyCharacterSet("в", nil, ["в",":"], ":", nil, [":",";"])))
    row.append(generateKey(for: KeyCharacterSet("а", nil, ["а",";"], ";", nil, ["°",";","%","‰"])))
    row.append(generateKey(for: KeyCharacterSet("п", nil, ["п","№"], "№", nil, nil)))
    row.append(generateKey(for: KeyCharacterSet("р", nil, ["р","₽"], "₽", nil, ["₽","€","$","¢","£","¥"])))
    row.append(generateKey(for: KeyCharacterSet("о", nil, ["о","+","ӧ"], "+", nil, ["+","±"])))
    row.append(generateKey(for: KeyCharacterSet("л", nil, ["л","-"], "-", nil, ["-","—","_"])))
    row.append(generateKey(for: KeyCharacterSet("д", nil, ["д","="], "=", nil, ["≈","≠","=","≥",">"])))
    row.append(generateKey(for: KeyCharacterSet("ж", nil, ["ж","@"], "@", nil, ["×","@"])))
    row.append(generateKey(for: KeyCharacterSet("э", nil, ["э","\""], "\"", nil, ["'","«","»","\""])))
    row.append(generateKey(for: KeyCharacterSet("ӧ", nil, ["'","ӧ"], "'", nil, nil)))
    return row
  }
  
  private func generateRow3() -> Row {
    var row = Row()
    row.append(generateKey(for: KeyCharacterSet("я", nil, ["я","("], "(", nil, ["(","[","{"])))
    row.append(generateKey(for: KeyCharacterSet("ч", nil, ["ч",")"], ")", nil, [")","]","}"])))
    row.append(generateKey(for: KeyCharacterSet("с", nil, ["с",","], ",", nil, [",",";"])))
    row.append(generateKey(for: KeyCharacterSet("м", nil, ["м","!"], "!", nil, ["!","¡"])))
    row.append(generateKey(for: KeyCharacterSet("и", nil, ["і","и","?"], "?", nil, ["?","\""])))
    row.append(generateKey(for: KeyCharacterSet("т", nil, ["т","."], ".", nil, ["…",".",":"])))
    row.append(generateKey(for: KeyCharacterSet("ь", nil, ["ъ","ь",","], ",", nil, [",",".",";"])))
    row.append(generateKey(for: KeyCharacterSet("б", nil, ["<","б"], "<", nil, ["<",">"])))
    row.append(generateKey(for: KeyCharacterSet("ю", nil, [">","ю"], ">", nil, [">","<"])))
    return row
  }
  
  private func generateKey(for characterSet: KeyCharacterSet, level: LetterKeyView.Level = .primary) -> Key {
    let view = LetterKeyView()
    view.setLetters(primary: characterSet.primaryLetter, secondary: characterSet.secondaryLetter, level: level)
    return Key(set: characterSet, view: view)
  }
  
}
