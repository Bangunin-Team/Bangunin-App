# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Bangunin' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Bangunin
  pod 'GoogleMaps', '6.1.0'
  pod 'Google-Maps-iOS-Utils', '3.4.0'
  
  target 'BanguninTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'BanguninUITests' do
    # Pods for testing
  end

end

post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
  end
end
