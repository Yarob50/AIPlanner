// MIT License
//
// Copyright (c) 2017-2019 MessageKit
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import AVFoundation
import CoreLocation
import MessageKit
import UIKit

final internal class SampleData {
  // MARK: Lifecycle

  private init() { }

  // MARK: Internal
  enum MessageTypes: String, CaseIterable {
    case Text
  }

  static let shared = SampleData()

  let system = MockUser(senderId: "000000", displayName: "System")
  let nathan = MockUser(senderId: "000001", displayName: "EventfulBot")
  let steven = MockUser(senderId: "000002", displayName: "")
  let wu = MockUser(senderId: "000003", displayName: "Wu Zhong")

  lazy var senders = [nathan, steven, wu]


  var now = Date()
  let messageImages: [UIImage] = [#imageLiteral(resourceName: "Icon awesome-user-tag"), #imageLiteral(resourceName: "iconMaterialEmail")]

  let attributes = ["Font1", "Font2", "Font3", "Font4", "Color", "Combo"]

  var currentSender: MockUser {
    steven
  }

  func attributedString(with text: String) -> NSAttributedString {
    let nsString = NSString(string: text)
    var mutableAttributedString = NSMutableAttributedString(string: text)
    let randomAttribute = Int(arc4random_uniform(UInt32(attributes.count)))
    let range = NSRange(location: 0, length: nsString.length)

    return NSAttributedString(attributedString: mutableAttributedString)
  }

  func dateAddingRandomTime() -> Date {
    let randomNumber = Int(arc4random_uniform(UInt32(10)))
    if randomNumber % 2 == 0 {
      let date = Calendar.current.date(byAdding: .hour, value: randomNumber, to: now)!
      now = date
      return date
    } else {
      let randomMinute = Int(arc4random_uniform(UInt32(59)))
      let date = Calendar.current.date(byAdding: .minute, value: randomMinute, to: now)!
      now = date
      return date
    }
  }

  func randomMessageType() -> MessageTypes {
//    MessageTypes.allCases.compactMap {
//      guard UserDefaults.standard.bool(forKey: "\($0.rawValue)" + " Messages") else { return nil }
//      return $0
//    }.random()
      
      return .Text
  }

  // swiftlint:disable cyclomatic_complexity
  func randomMessage(allowedSenders: [MockUser]) -> MockMessage {
    let uniqueID = UUID().uuidString
    let user = allowedSenders.random()!
    let date = dateAddingRandomTime()
    switch randomMessageType() {
    case .Text:
      let randomSentence = Lorem.sentence()
      return MockMessage(text: randomSentence, user: user, messageId: uniqueID, date: date)
    }
  }

  // swiftlint:enable cyclomatic_complexity
  func getMessages(count: Int, completion: ([MockMessage]) -> Void) {
    var messages: [MockMessage] = []
    // Disable Custom Messages
    UserDefaults.standard.set(false, forKey: "Custom Messages")
    for _ in 0 ..< count {
      let uniqueID = UUID().uuidString
      let user = senders.random()!
      let date = dateAddingRandomTime()
      let randomSentence = Lorem.sentence()
      let message = MockMessage(text: randomSentence, user: user, messageId: uniqueID, date: date)
      messages.append(message)
    }
    completion(messages)
  }

  func getMessages(count: Int) -> [MockMessage] {
    var messages: [MockMessage] = []
    // Disable Custom Messages
    UserDefaults.standard.set(false, forKey: "Custom Messages")
    for _ in 0 ..< count {
      let uniqueID = UUID().uuidString
      let user = senders.random()!
      let date = dateAddingRandomTime()
      let randomSentence = Lorem.sentence()
      let message = MockMessage(text: randomSentence, user: user, messageId: uniqueID, date: date)
      messages.append(message)
    }
    return messages
  }

  func getAdvancedMessages(count: Int, completion: ([MockMessage]) -> Void) {
    var messages: [MockMessage] = []
    // Enable Custom Messages
    UserDefaults.standard.set(true, forKey: "Custom Messages")
    for _ in 0 ..< count {
      let message = randomMessage(allowedSenders: senders)
      messages.append(message)
    }
    completion(messages)
  }

  func getMessages(count: Int, allowedSenders _: [MockUser], completion: ([MockMessage]) -> Void) {
    var messages: [MockMessage] = []
    // Disable Custom Messages
    UserDefaults.standard.set(false, forKey: "Custom Messages")
    for _ in 0 ..< count {
      let uniqueID = UUID().uuidString
      let user = senders.random()!
      let date = dateAddingRandomTime()
      let randomSentence = Lorem.sentence()
      let message = MockMessage(text: randomSentence, user: user, messageId: uniqueID, date: date)
      messages.append(message)
    }
    completion(messages)
  }

  func getAvatarFor(sender: SenderType) -> Avatar {
    let firstName = sender.displayName.components(separatedBy: " ").first
    let lastName = sender.displayName.components(separatedBy: " ").first
    let initials = "\(firstName?.first ?? "A")\(lastName?.first ?? "A")"
    switch sender.senderId {
    case "000001":
      return Avatar(image: #imageLiteral(resourceName: "chatUser"), initials: initials)
    case "000002":
      return Avatar(image: #imageLiteral(resourceName: "chatUser"), initials: initials)
    case "000003":
      return Avatar(image: #imageLiteral(resourceName: "chatUser"), initials: initials)
    case "000000":
      return Avatar(image: nil, initials: "SS")
    default:
      return Avatar(image: nil, initials: initials)
    }
  }
}
