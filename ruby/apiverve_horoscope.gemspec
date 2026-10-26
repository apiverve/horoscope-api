# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "apiverve_horoscope"
  spec.version       = "1.2.3"
  spec.authors       = ["APIVerve"]
  spec.email         = ["hello@apiverve.com"]

  spec.summary       = "Horoscope API - Ruby Client"
  spec.description   = "Horoscope fetches daily horoscope readings and sign details for any of the twelve zodiac signs. Pass a sign name to receive today's forecast text; paid tiers add birthdate lookups, mood, lucky numbers, sign compatibility, and sign facts like the ruling planet, opposite sign, brightest star and days until the sign's season."
  spec.homepage      = "https://apiverve.com/marketplace/horoscope?utm_source=ruby&utm_medium=referral&utm_content=homepage"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/apiverve/horoscope-API/tree/main/ruby"
  spec.metadata["changelog_uri"] = "https://apiverve.com/changelog"
  spec.metadata["documentation_uri"] = "https://docs.apiverve.com/ref/horoscope"

  spec.files = Dir.glob("{lib}/**/*") + %w[README.md LICENSE]
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", ">= 1.0", "< 3.0"
  spec.add_dependency "faraday-multipart", "~> 1.0"
  spec.add_dependency "json", "~> 2.0"
end
