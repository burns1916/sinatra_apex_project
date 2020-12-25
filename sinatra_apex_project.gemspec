require_relative 'lib/sinatra_apex_project/version'

Gem::Specification.new do |spec|
  spec.name          = "sinatra_apex_project"
  spec.version       = SinatraApexProject::VERSION
  spec.authors       = ["Ryan Burns"]
  spec.email         = ["ryankburns@gmail.com"]

  spec.summary       = %q{Sinatra Final Project - Apex Legends}
  spec.description   = %q{Create a profile to track stats and favorite buildouts on Apex Legends}
  spec.homepage      = "htt[://www.myapex.com"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "http://www.myapex.com"
  spec.metadata["changelog_uri"] = "http://www.myapex.com"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
