#
# Be sure to run `pod lib lint CountableLabel.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|

  s.swift_version    = '5.0'
  s.name             = 'CountableLabel'
  s.version          = '0.2.0'
  s.summary          = 'A subclass of UILabel that provides the ablity to animate how the text is animated.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  This CocoaPod provides the ability to use a `UILabel` that may be animated with one of four different effect, the pushUp style which will make it seem as though the label is getting updated from bottom to top, the pushDown style which will make it seem as though the label is getting update from top to bottom; last but not least the fade style which will animate the label by using a fading animation.
                       DESC

  s.homepage         = 'https://github.com/stockx/CountableLabel'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'andrewfoghel' => 'andrewfoghel@gmail.com' }
  s.source           = { :git => 'https://github.com/stockx/CountableLabel.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'CountableLabel/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CountableLabel' => ['CountableLabel/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
