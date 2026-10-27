Pod::Spec.new do |s|
  s.name             = 'APIVerveHoroscope'
  s.version          = '1.2.3'
  s.summary          = 'Horoscope fetches daily horoscope readings and sign details for any of the twelve zodiac signs.'
  s.description      = <<-'DESC'
Horoscope fetches daily horoscope readings and sign details for any of the twelve zodiac signs. Pass a sign name to receive today's forecast text; paid tiers add birthdate lookups, mood, lucky numbers, sign compatibility, and sign facts like the ruling planet, opposite sign, brightest star and days until the sign's season.

This iOS/macOS SDK provides a convenient way to access the Horoscope from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/horoscope?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/horoscope-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVerveHoroscope/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
