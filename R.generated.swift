//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import RswiftResources
import UIKit

private class BundleFinder {}
let R = _R(bundle: Bundle(for: BundleFinder.self))

struct _R {
  let bundle: Foundation.Bundle
  var color: color { .init(bundle: bundle) }
  var image: image { .init(bundle: bundle) }
  var info: info { .init(bundle: bundle) }
  var nib: nib { .init(bundle: bundle) }
  var storyboard: storyboard { .init(bundle: bundle) }

  func color(bundle: Foundation.Bundle) -> color {
    .init(bundle: bundle)
  }
  func image(bundle: Foundation.Bundle) -> image {
    .init(bundle: bundle)
  }
  func info(bundle: Foundation.Bundle) -> info {
    .init(bundle: bundle)
  }
  func nib(bundle: Foundation.Bundle) -> nib {
    .init(bundle: bundle)
  }
  func storyboard(bundle: Foundation.Bundle) -> storyboard {
    .init(bundle: bundle)
  }
  func validate() throws {
    try self.nib.validate()
    try self.storyboard.validate()
  }

  struct project {
    let developmentRegion = "en"
  }

  /// This `_R.color` struct is generated, and contains static references to 1 colors.
  struct color {
    let bundle: Foundation.Bundle

    /// Color `AccentColor`.
    var accentColor: RswiftResources.ColorResource { .init(name: "AccentColor", path: [], bundle: bundle) }
  }

  /// This `_R.image` struct is generated, and contains static references to 3 images.
  struct image {
    let bundle: Foundation.Bundle

    /// Image `pants1`.
    var pants1: RswiftResources.ImageResource { .init(name: "pants1", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `shoes1`.
    var shoes1: RswiftResources.ImageResource { .init(name: "shoes1", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `shoes2`.
    var shoes2: RswiftResources.ImageResource { .init(name: "shoes2", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }
  }

  /// This `_R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    let bundle: Foundation.Bundle
    var uiApplicationSceneManifest: uiApplicationSceneManifest { .init(bundle: bundle) }

    func uiApplicationSceneManifest(bundle: Foundation.Bundle) -> uiApplicationSceneManifest {
      .init(bundle: bundle)
    }

    struct uiApplicationSceneManifest {
      let bundle: Foundation.Bundle

      let uiApplicationSupportsMultipleScenes: Bool = false

      var _key: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest"], key: "_key") ?? "UIApplicationSceneManifest" }
      var uiSceneConfigurations: uiSceneConfigurations { .init(bundle: bundle) }

      func uiSceneConfigurations(bundle: Foundation.Bundle) -> uiSceneConfigurations {
        .init(bundle: bundle)
      }

      struct uiSceneConfigurations {
        let bundle: Foundation.Bundle
        var _key: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations"], key: "_key") ?? "UISceneConfigurations" }
        var uiWindowSceneSessionRoleApplication: uiWindowSceneSessionRoleApplication { .init(bundle: bundle) }

        func uiWindowSceneSessionRoleApplication(bundle: Foundation.Bundle) -> uiWindowSceneSessionRoleApplication {
          .init(bundle: bundle)
        }

        struct uiWindowSceneSessionRoleApplication {
          let bundle: Foundation.Bundle
          var defaultConfiguration: defaultConfiguration { .init(bundle: bundle) }

          func defaultConfiguration(bundle: Foundation.Bundle) -> defaultConfiguration {
            .init(bundle: bundle)
          }

          struct defaultConfiguration {
            let bundle: Foundation.Bundle
            var uiSceneConfigurationName: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication"], key: "UISceneConfigurationName") ?? "Default Configuration" }
            var uiSceneDelegateClassName: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication"], key: "UISceneDelegateClassName") ?? "$(PRODUCT_MODULE_NAME).SceneDelegate" }
          }
        }
      }
    }
  }

  /// This `_R.nib` struct is generated, and contains static references to 7 nibs.
  struct nib {
    let bundle: Foundation.Bundle

    /// Nib `ItemMainInfoCell`.
    var itemMainInfoCell: RswiftResources.NibReference<ItemMainInfoCell> { .init(name: "ItemMainInfoCell", bundle: bundle) }

    /// Nib `ItemPhotoCell`.
    var itemPhotoCell: RswiftResources.NibReference<ItemPhotoCell> { .init(name: "ItemPhotoCell", bundle: bundle) }

    /// Nib `ItemPhotoCollectionViewCell`.
    var itemPhotoCollectionViewCell: RswiftResources.NibReference<ItemPhotoCollectionViewCell> { .init(name: "ItemPhotoCollectionViewCell", bundle: bundle) }

    /// Nib `ItemPriceCell`.
    var itemPriceCell: RswiftResources.NibReference<ItemPriceCell> { .init(name: "ItemPriceCell", bundle: bundle) }

    /// Nib `ListedItemCell`.
    var listedItemCell: RswiftResources.NibReference<ListedItemCell> { .init(name: "ListedItemCell", bundle: bundle) }

    /// Nib `UserCreditCell`.
    var userCreditCell: RswiftResources.NibReference<UserCreditCell> { .init(name: "UserCreditCell", bundle: bundle) }

    /// Nib `UserIconCell`.
    var userIconCell: RswiftResources.NibReference<UserIconCell> { .init(name: "UserIconCell", bundle: bundle) }

    func validate() throws {
      if #available(iOS 13.0, *) { if UIKit.UIImage(systemName: "camera.fill") == nil { throw RswiftResources.ValidationError("[R.swift] System image named 'camera.fill' is used in nib 'ItemPhotoCollectionViewCell', but couldn't be loaded.") } }
      if UIKit.UIImage(named: "pants1", in: bundle, compatibleWith: nil) == nil { throw RswiftResources.ValidationError("[R.swift] Image named 'pants1' is used in nib 'ListedItemCell', but couldn't be loaded.") }
      if UIKit.UIImage(named: "shoes1", in: bundle, compatibleWith: nil) == nil { throw RswiftResources.ValidationError("[R.swift] Image named 'shoes1' is used in nib 'ListedItemCell', but couldn't be loaded.") }
      if UIKit.UIImage(named: "shoes2", in: bundle, compatibleWith: nil) == nil { throw RswiftResources.ValidationError("[R.swift] Image named 'shoes2' is used in nib 'ListedItemCell', but couldn't be loaded.") }
      if #available(iOS 13.0, *) { if UIKit.UIImage(systemName: "person.crop.circle.fill") == nil { throw RswiftResources.ValidationError("[R.swift] System image named 'person.crop.circle.fill' is used in nib 'UserIconCell', but couldn't be loaded.") } }
    }
  }

  /// This `_R.storyboard` struct is generated, and contains static references to 12 storyboards.
  struct storyboard {
    let bundle: Foundation.Bundle
    var itemList: itemList { .init(bundle: bundle) }
    var launchScreen: launchScreen { .init(bundle: bundle) }
    var login: login { .init(bundle: bundle) }
    var registrationAddress: registrationAddress { .init(bundle: bundle) }
    var registrationBirthday: registrationBirthday { .init(bundle: bundle) }
    var registrationEmailAndPassword: registrationEmailAndPassword { .init(bundle: bundle) }
    var registrationInputResult: registrationInputResult { .init(bundle: bundle) }
    var registrationName: registrationName { .init(bundle: bundle) }
    var tab: tab { .init(bundle: bundle) }
    var userExhibit: userExhibit { .init(bundle: bundle) }
    var userInputItemInfo: userInputItemInfo { .init(bundle: bundle) }
    var userMyPage: userMyPage { .init(bundle: bundle) }

    func itemList(bundle: Foundation.Bundle) -> itemList {
      .init(bundle: bundle)
    }
    func launchScreen(bundle: Foundation.Bundle) -> launchScreen {
      .init(bundle: bundle)
    }
    func login(bundle: Foundation.Bundle) -> login {
      .init(bundle: bundle)
    }
    func registrationAddress(bundle: Foundation.Bundle) -> registrationAddress {
      .init(bundle: bundle)
    }
    func registrationBirthday(bundle: Foundation.Bundle) -> registrationBirthday {
      .init(bundle: bundle)
    }
    func registrationEmailAndPassword(bundle: Foundation.Bundle) -> registrationEmailAndPassword {
      .init(bundle: bundle)
    }
    func registrationInputResult(bundle: Foundation.Bundle) -> registrationInputResult {
      .init(bundle: bundle)
    }
    func registrationName(bundle: Foundation.Bundle) -> registrationName {
      .init(bundle: bundle)
    }
    func tab(bundle: Foundation.Bundle) -> tab {
      .init(bundle: bundle)
    }
    func userExhibit(bundle: Foundation.Bundle) -> userExhibit {
      .init(bundle: bundle)
    }
    func userInputItemInfo(bundle: Foundation.Bundle) -> userInputItemInfo {
      .init(bundle: bundle)
    }
    func userMyPage(bundle: Foundation.Bundle) -> userMyPage {
      .init(bundle: bundle)
    }
    func validate() throws {
      try self.itemList.validate()
      try self.launchScreen.validate()
      try self.login.validate()
      try self.registrationAddress.validate()
      try self.registrationBirthday.validate()
      try self.registrationEmailAndPassword.validate()
      try self.registrationInputResult.validate()
      try self.registrationName.validate()
      try self.tab.validate()
      try self.userExhibit.validate()
      try self.userInputItemInfo.validate()
      try self.userMyPage.validate()
    }


    /// Storyboard `ItemList`.
    struct itemList: RswiftResources.StoryboardReference {
      let bundle: Foundation.Bundle

      let name = "ItemList"

      var itemList: RswiftResources.StoryboardViewControllerIdentifier<ItemListViewController> { .init(identifier: "ItemList", storyboard: name, bundle: bundle) }
      var itemListNavigationController: RswiftResources.StoryboardViewControllerIdentifier<UIKit.UINavigationController> { .init(identifier: "ItemListNavigationController", storyboard: name, bundle: bundle) }

      func validate() throws {
        if itemList() == nil { throw RswiftResources.ValidationError("[R.swift] ViewController with identifier 'itemList' could not be loaded from storyboard 'ItemList' as 'ItemListViewController'.") }
        if itemListNavigationController() == nil { throw RswiftResources.ValidationError("[R.swift] ViewController with identifier 'itemListNavigationController' could not be loaded from storyboard 'ItemList' as 'UIKit.UINavigationController'.") }
      }
    }

    /// Storyboard `LaunchScreen`.
    struct launchScreen: RswiftResources.StoryboardReference, RswiftResources.InitialControllerContainer {
      typealias InitialController = UIKit.UIViewController

      let bundle: Foundation.Bundle

      let name = "LaunchScreen"
      func validate() throws {

      }
    }

    /// Storyboard `Login`.
    struct login: RswiftResources.StoryboardReference, RswiftResources.InitialControllerContainer {
      typealias InitialController = UIKit.UINavigationController

      let bundle: Foundation.Bundle

      let name = "Login"

      var login: RswiftResources.StoryboardViewControllerIdentifier<LoginViewController> { .init(identifier: "Login", storyboard: name, bundle: bundle) }

      func validate() throws {
        if login() == nil { throw RswiftResources.ValidationError("[R.swift] ViewController with identifier 'login' could not be loaded from storyboard 'Login' as 'LoginViewController'.") }
      }
    }

    /// Storyboard `RegistrationAddress`.
    struct registrationAddress: RswiftResources.StoryboardReference, RswiftResources.InitialControllerContainer {
      typealias InitialController = RegistrationAddressViewController

      let bundle: Foundation.Bundle

      let name = "RegistrationAddress"

      var registrationAddress: RswiftResources.StoryboardViewControllerIdentifier<RegistrationAddressViewController> { .init(identifier: "RegistrationAddress", storyboard: name, bundle: bundle) }

      func validate() throws {
        if registrationAddress() == nil { throw RswiftResources.ValidationError("[R.swift] ViewController with identifier 'registrationAddress' could not be loaded from storyboard 'RegistrationAddress' as 'RegistrationAddressViewController'.") }
      }
    }

    /// Storyboard `RegistrationBirthday`.
    struct registrationBirthday: RswiftResources.StoryboardReference, RswiftResources.InitialControllerContainer {
      typealias InitialController = RegistrationBirthdayViewController

      let bundle: Foundation.Bundle

      let name = "RegistrationBirthday"

      var registrationBirthday: RswiftResources.StoryboardViewControllerIdentifier<RegistrationBirthdayViewController> { .init(identifier: "RegistrationBirthday", storyboard: name, bundle: bundle) }

      func validate() throws {
        if #available(iOS 13.0, *) { if UIKit.UIImage(systemName: "birthday.cake") == nil { throw RswiftResources.ValidationError("[R.swift] System image named 'birthday.cake' is used in storyboard 'RegistrationBirthday', but couldn't be loaded.") } }
        if registrationBirthday() == nil { throw RswiftResources.ValidationError("[R.swift] ViewController with identifier 'registrationBirthday' could not be loaded from storyboard 'RegistrationBirthday' as 'RegistrationBirthdayViewController'.") }
      }
    }

    /// Storyboard `RegistrationEmailAndPassword`.
    struct registrationEmailAndPassword: RswiftResources.StoryboardReference, RswiftResources.InitialControllerContainer {
      typealias InitialController = RegistrationEmailAndPasswordViewController

      let bundle: Foundation.Bundle

      let name = "RegistrationEmailAndPassword"

      var registrationEmailAndPassword: RswiftResources.StoryboardViewControllerIdentifier<RegistrationEmailAndPasswordViewController> { .init(identifier: "RegistrationEmailAndPassword", storyboard: name, bundle: bundle) }

      func validate() throws {
        if #available(iOS 13.0, *) { if UIKit.UIImage(systemName: "mail") == nil { throw RswiftResources.ValidationError("[R.swift] System image named 'mail' is used in storyboard 'RegistrationEmailAndPassword', but couldn't be loaded.") } }
        if registrationEmailAndPassword() == nil { throw RswiftResources.ValidationError("[R.swift] ViewController with identifier 'registrationEmailAndPassword' could not be loaded from storyboard 'RegistrationEmailAndPassword' as 'RegistrationEmailAndPasswordViewController'.") }
      }
    }

    /// Storyboard `RegistrationInputResult`.
    struct registrationInputResult: RswiftResources.StoryboardReference, RswiftResources.InitialControllerContainer {
      typealias InitialController = RegistrationInputResultViewController

      let bundle: Foundation.Bundle

      let name = "RegistrationInputResult"

      var registrationInputResult: RswiftResources.StoryboardViewControllerIdentifier<RegistrationInputResultViewController> { .init(identifier: "RegistrationInputResult", storyboard: name, bundle: bundle) }

      func validate() throws {
        if registrationInputResult() == nil { throw RswiftResources.ValidationError("[R.swift] ViewController with identifier 'registrationInputResult' could not be loaded from storyboard 'RegistrationInputResult' as 'RegistrationInputResultViewController'.") }
      }
    }

    /// Storyboard `RegistrationName`.
    struct registrationName: RswiftResources.StoryboardReference, RswiftResources.InitialControllerContainer {
      typealias InitialController = RegistrationNameViewController

      let bundle: Foundation.Bundle

      let name = "RegistrationName"

      var registrationName: RswiftResources.StoryboardViewControllerIdentifier<RegistrationNameViewController> { .init(identifier: "RegistrationName", storyboard: name, bundle: bundle) }

      func validate() throws {
        if #available(iOS 13.0, *) { if UIKit.UIImage(systemName: "person.crop.circle.fill") == nil { throw RswiftResources.ValidationError("[R.swift] System image named 'person.crop.circle.fill' is used in storyboard 'RegistrationName', but couldn't be loaded.") } }
        if registrationName() == nil { throw RswiftResources.ValidationError("[R.swift] ViewController with identifier 'registrationName' could not be loaded from storyboard 'RegistrationName' as 'RegistrationNameViewController'.") }
      }
    }

    /// Storyboard `Tab`.
    struct tab: RswiftResources.StoryboardReference, RswiftResources.InitialControllerContainer {
      typealias InitialController = TabRootViewController

      let bundle: Foundation.Bundle

      let name = "Tab"

      var tabRootViewController: RswiftResources.StoryboardViewControllerIdentifier<TabRootViewController> { .init(identifier: "TabRootViewController", storyboard: name, bundle: bundle) }

      func validate() throws {
        if tabRootViewController() == nil { throw RswiftResources.ValidationError("[R.swift] ViewController with identifier 'tabRootViewController' could not be loaded from storyboard 'Tab' as 'TabRootViewController'.") }
      }
    }

    /// Storyboard `UserExhibit`.
    struct userExhibit: RswiftResources.StoryboardReference, RswiftResources.InitialControllerContainer {
      typealias InitialController = UserExhibitViewController

      let bundle: Foundation.Bundle

      let name = "UserExhibit"
      func validate() throws {
        if #available(iOS 13.0, *) { if UIKit.UIImage(systemName: "camera") == nil { throw RswiftResources.ValidationError("[R.swift] System image named 'camera' is used in storyboard 'UserExhibit', but couldn't be loaded.") } }
        if #available(iOS 13.0, *) { if UIKit.UIImage(systemName: "photo.artframe") == nil { throw RswiftResources.ValidationError("[R.swift] System image named 'photo.artframe' is used in storyboard 'UserExhibit', but couldn't be loaded.") } }
      }
    }

    /// Storyboard `UserInputItemInfo`.
    struct userInputItemInfo: RswiftResources.StoryboardReference, RswiftResources.InitialControllerContainer {
      typealias InitialController = UserInputItemInfoViewController

      let bundle: Foundation.Bundle

      let name = "UserInputItemInfo"

      var userInputItemInfo: RswiftResources.StoryboardViewControllerIdentifier<UserInputItemInfoViewController> { .init(identifier: "UserInputItemInfo", storyboard: name, bundle: bundle) }

      func validate() throws {
        if userInputItemInfo() == nil { throw RswiftResources.ValidationError("[R.swift] ViewController with identifier 'userInputItemInfo' could not be loaded from storyboard 'UserInputItemInfo' as 'UserInputItemInfoViewController'.") }
      }
    }

    /// Storyboard `UserMyPage`.
    struct userMyPage: RswiftResources.StoryboardReference, RswiftResources.InitialControllerContainer {
      typealias InitialController = UserMyPageViewController

      let bundle: Foundation.Bundle

      let name = "UserMyPage"

      var userMyPage: RswiftResources.StoryboardViewControllerIdentifier<UserMyPageViewController> { .init(identifier: "UserMyPage", storyboard: name, bundle: bundle) }

      func validate() throws {
        if userMyPage() == nil { throw RswiftResources.ValidationError("[R.swift] ViewController with identifier 'userMyPage' could not be loaded from storyboard 'UserMyPage' as 'UserMyPageViewController'.") }
      }
    }
  }
}