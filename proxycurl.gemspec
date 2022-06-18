require_relative "lib/proxycurl/version"

Gem::Specification.new do |spec|
  spec.name = "proxycurl"
  spec.version = Proxycurl::VERSION
  spec.authors = ["jsegura"]
  spec.email = ["javism@gmail.com"]

  spec.summary = %q{Proxycurl client}
  spec.description = %q{Proxycurl client}
  spec.homepage = "https://github.com/jsegura/proxycurl"
  spec.license = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/jsegura/proxycurl"
  spec.metadata["changelog_uri"] = "https://github.com/jsegura/proxycurl"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty"
end
