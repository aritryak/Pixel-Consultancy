//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation


import smart_auth

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  SmartAuthPlugin.register(with: registry.registrar(forPlugin: "SmartAuthPlugin"))
=======
import path_provider_foundation
import wakelock_macos

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  PathProviderPlugin.register(with: registry.registrar(forPlugin: "PathProviderPlugin"))
  WakelockMacosPlugin.register(with: registry.registrar(forPlugin: "WakelockMacosPlugin"))

}
