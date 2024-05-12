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
  var font: font { .init(bundle: bundle) }
  var file: file { .init(bundle: bundle) }
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
  func font(bundle: Foundation.Bundle) -> font {
    .init(bundle: bundle)
  }
  func file(bundle: Foundation.Bundle) -> file {
    .init(bundle: bundle)
  }
  func storyboard(bundle: Foundation.Bundle) -> storyboard {
    .init(bundle: bundle)
  }
  func validate() throws {
    try self.font.validate()
    try self.storyboard.validate()
  }

  struct project {
    let developmentRegion = "en"
  }

  /// This `_R.color` struct is generated, and contains static references to 11 colors.
  struct color {
    let bundle: Foundation.Bundle

    /// Color `AccentColor`.
    var accentColor: RswiftResources.ColorResource { .init(name: "AccentColor", path: [], bundle: bundle) }

    /// Color `c000000`.
    var c000000: RswiftResources.ColorResource { .init(name: "c000000", path: [], bundle: bundle) }

    /// Color `c055EBE`.
    var c055EBE: RswiftResources.ColorResource { .init(name: "c055EBE", path: [], bundle: bundle) }

    /// Color `c121D36`.
    var c121D36: RswiftResources.ColorResource { .init(name: "c121D36", path: [], bundle: bundle) }

    /// Color `c1A304D`.
    var c1A304D: RswiftResources.ColorResource { .init(name: "c1A304D", path: [], bundle: bundle) }

    /// Color `c1B67D9`.
    var c1B67D9: RswiftResources.ColorResource { .init(name: "c1B67D9", path: [], bundle: bundle) }

    /// Color `c1D273F`.
    var c1D273F: RswiftResources.ColorResource { .init(name: "c1D273F", path: [], bundle: bundle) }

    /// Color `c20315A`.
    var c20315A: RswiftResources.ColorResource { .init(name: "c20315A", path: [], bundle: bundle) }

    /// Color `c283F63`.
    var c283F63: RswiftResources.ColorResource { .init(name: "c283F63", path: [], bundle: bundle) }

    /// Color `c3E659E`.
    var c3E659E: RswiftResources.ColorResource { .init(name: "c3E659E", path: [], bundle: bundle) }

    /// Color `cFEFFFF`.
    var cFEFFFF: RswiftResources.ColorResource { .init(name: "cFEFFFF", path: [], bundle: bundle) }
  }

  /// This `_R.image` struct is generated, and contains static references to 7 images.
  struct image {
    let bundle: Foundation.Bundle

    /// Image `arrowImage`.
    var arrowImage: RswiftResources.ImageResource { .init(name: "arrowImage", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `backgroundImage`.
    var backgroundImage: RswiftResources.ImageResource { .init(name: "backgroundImage", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `cencelIcon`.
    var cencelIcon: RswiftResources.ImageResource { .init(name: "cencelIcon", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `dateImage`.
    var dateImage: RswiftResources.ImageResource { .init(name: "dateImage", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `israelImage`.
    var israelImage: RswiftResources.ImageResource { .init(name: "israelImage", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `planetImage`.
    var planetImage: RswiftResources.ImageResource { .init(name: "planetImage", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `searchImage`.
    var searchImage: RswiftResources.ImageResource { .init(name: "searchImage", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }
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

  /// This `_R.font` struct is generated, and contains static references to 2 fonts.
  struct font: Sequence {
    let bundle: Foundation.Bundle

    /// Font `Poppins-Bold`.
    var poppinsBold: RswiftResources.FontResource { .init(name: "Poppins-Bold", bundle: bundle, filename: "Poppins-Bold.ttf") }

    /// Font `Poppins-Medium`.
    var poppinsMedium: RswiftResources.FontResource { .init(name: "Poppins-Medium", bundle: bundle, filename: "Poppins-Medium.ttf") }

    func makeIterator() -> IndexingIterator<[RswiftResources.FontResource]> {
      [poppinsBold, poppinsMedium].makeIterator()
    }
    func validate() throws {
      for font in self {
        if !font.canBeLoaded() { throw RswiftResources.ValidationError("[R.swift] Font '\(font.name)' could not be loaded, is '\(font.filename)' added to the UIAppFonts array in this targets Info.plist?") }
      }
    }
  }

  /// This `_R.file` struct is generated, and contains static references to 2 resource files.
  struct file {
    let bundle: Foundation.Bundle

    /// Resource file `Poppins-Bold.ttf`.
    var poppinsBoldTtf: RswiftResources.FileResource { .init(name: "Poppins-Bold", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Poppins-Medium.ttf`.
    var poppinsMediumTtf: RswiftResources.FileResource { .init(name: "Poppins-Medium", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }
  }

  /// This `_R.storyboard` struct is generated, and contains static references to 1 storyboards.
  struct storyboard {
    let bundle: Foundation.Bundle
    var launchScreen: launchScreen { .init(bundle: bundle) }

    func launchScreen(bundle: Foundation.Bundle) -> launchScreen {
      .init(bundle: bundle)
    }
    func validate() throws {
      try self.launchScreen.validate()
    }


    /// Storyboard `LaunchScreen`.
    struct launchScreen: RswiftResources.StoryboardReference, RswiftResources.InitialControllerContainer {
      typealias InitialController = UIKit.UIViewController

      let bundle: Foundation.Bundle

      let name = "LaunchScreen"
      func validate() throws {

      }
    }
  }
}