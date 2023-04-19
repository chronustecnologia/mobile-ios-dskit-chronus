#
# Be sure to run `pod lib lint ChronusDS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ChronusDS'
  s.version          = '0.1.0'
  s.summary          = 'Design system kit com componentes para empresa Chronus Tecnologia'

  s.description      = <<-DESC
  Design system kit onde é desenvolvido os componentes e funções globais utilizados nos aplicativos da empresa Chronus Tecnolgoia.
                       DESC

   s.homepage         = 'https://github.com/chronustecnologia/mobile-ios-dskit-chronus'
   s.license          = { :type => 'MIT', :file => 'LICENSE' }
   s.author           = { 'chronustecnologia' => 'chronustecnologiasoftware@gmail.com' }
   s.source           = { :git => 'https://chronustecnologia@github.com/chronustecnologia/mobile-ios-dskit-chronus.git', :tag => s.version.to_s }
   # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

   s.ios.deployment_target = '13.0'
   s.swift_version = '5.0'

   s.source_files = 'ChronusDS/Classes/**/*'

  # s.resource_bundles = {
  #   'ChronusDS' => ['ChronusDS/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
