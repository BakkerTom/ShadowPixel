Pod::Spec.new do |s|
  s.name             = 'ShadowPixel'
  s.version          = '0.1.0'
  s.summary          = 'Firebase Analytics plug-in to monitor analytics health'

  s.description      = <<-DESC
  ShadowPixel is a service to monitor the health of your analytics implementation. It 
  does this by hooking into Firebase Analytics, and monitoring logged events.

  The ShadowPixel service will check for irregularities in the logged information.
                       DESC

  s.homepage         = 'https://github.com/BakkerTom/ShadowPixel'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'git' => 'tom.bakker92@gmail.com' }
  s.source           = { :git => 'https://github.com/BakkerTom/ShadowPixel.git', :tag => s.version.to_s }
  s.social_media_url = 'https://bsky.app/profile/bakkertom.bsky.social'

  s.ios.deployment_target = '13.0'
  s.pod_target_xcconfig = {
      'OTHER_SWIFT_FLAGS' => '-package-name ShadowPixel'
  }

  s.source_files = 'Sources/ShadowPixel/**/*'

  s.static_framework = true
  s.dependency 'FirebaseAnalytics'
end
