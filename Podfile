# Uncomment the next line to define a global platform for your project
platform :ios, '14.0'

target 'gql' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for gql
  pod 'SDWebImageSwiftUI'
  pod 'SDWebImage'
  pod 'SQLite'
  pod 'Apollo'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
          # Needed for building for simulator on M1 Macs
          config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
      end
  end
end
