# Study_iOS
- [Extensions](#Extensions)
  + [UIAlertController+Extension](#UIAlertController+Extension)
  + [UITextField+Extension](#UITextField+Extension)
  + [UIView+Extension](#UIView+Extension)

<br>

## Extensions

### UIAlertController+Extension

<details>
<summary>1️. UIAlertController title font, color 커스텀하기</summary>
<div markdown="1">       

```Swift

func setTitle(font: UIFont?, color: UIColor?) {
    guard let title = self.title else { return }
    let attributeString = NSMutableAttributedString(string: title)
    
    if let titleFont = font {
        attributeString.addAttributes([NSAttributedString.Key.font: titleFont],
                                      range: NSRange(location: 0, length: title.count))
    }
    if let titleColor = color {
        attributeString.addAttributes([NSAttributedString.Key.foregroundColor: titleColor],
                                      range: NSRange(location: 0, length: title.count))
    }
    self.setValue(attributeString, forKey: "attributedTitle")
    
}

```

</div>
</details>

<details>
<summary>2. UIAlertController message font, color 커스텀하기</summary>
<div markdown="1">       

```Swift

func setMessage(font: UIFont?, color: UIColor?) {
    guard let message = self.message else { return }
    let attributeString = NSMutableAttributedString(string: message)
    if let messageFont = font {
        attributeString.addAttributes([NSAttributedString.Key.font: messageFont],
                                      range: NSRange(location: 0, length: message.count))
    }
    
    if let messageColorColor = color {
        attributeString.addAttributes([NSAttributedString.Key.foregroundColor: messageColorColor],
                                      range: NSRange(location: 0, length: message.count))
        
    }
    self.setValue(attributeString, forKey: "attributedMessage")
}

```

</div>
</details>

<details>
<summary>3. UIAlertController tint color 커스텀하기</summary>
<div markdown="1">       

```Swift

func setTint(color: UIColor) {
    self.view.tintColor = color
}
  
```

</div>
</details>


### UITextField+Extension

- [Introducing SwiftUI](https://developer.apple.com/tutorials/swiftui) - Create beautiful, dynamic apps faster than ever before.

### UIView+Extension

- [Introducing SwiftUI](https://developer.apple.com/tutorials/swiftui) - Create beautiful, dynamic apps faster than ever before.

<br>

## Libraries

### UIAlertController+Extension

- [Introducing SwiftUI](https://developer.apple.com/tutorials/swiftui) - Create beautiful, dynamic apps faster than ever before.

### UITextField+Extension

- [Introducing SwiftUI](https://developer.apple.com/tutorials/swiftui) - Create beautiful, dynamic apps faster than ever before.

### UIView+Extension

- [Introducing SwiftUI](https://developer.apple.com/tutorials/swiftui) - Create beautiful, dynamic apps faster than ever before.
