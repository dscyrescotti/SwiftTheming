Pod::Spec.new do |spec|
    spec.name          = 'SwiftTheming'
    spec.version       = '1.1.2'
    spec.license       = { :type => 'MIT', :file => 'LICENSE' }
    spec.homepage      = 'https://github.com/dscyrescotti/SwiftTheming'
    spec.authors       = { 'Scotti' => 'dscyrescotti@gmail.com' }
    spec.summary       = 'A powerful lightweight theme 🎨 manager for SwiftUI'
    spec.source        = { :git => 'https://github.com/dscyrescotti/SwiftTheming.git', :tag => 'v1.1.2' }
    spec.swift_versions = ['5.5']
  
    spec.ios.deployment_target  = '14.0'
    spec.macos.deployment_target  = '12.0'
    spec.tvos.deployment_target = '14.0'
    spec.watchos.deployment_target = '7.0'
  
    spec.source_files       = 'Sources/SwiftTheming/**/*.swift'
  
    spec.framework      = 'SwiftUI', 'Combine'
  end