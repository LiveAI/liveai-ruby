
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "liveai/version"

Gem::Specification.new do |spec|
  spec.name          = "liveai"
  spec.version       = Liveai::VERSION
  spec.authors       = ["Yoshiki Ohira"]
  spec.email         = ["tennmoku71@gmail.com"]

  spec.summary       = %q{A platform that constructs ondemand AI engine automatically by users infomatic requests.}
  spec.description   = %q{live ai is an online platform for enabling operators of all kinds of webs to operate machine learning easily. The web site generally has to return a response in a very short time after the user has accessed it. It is very costly to operate machine learning in a real environment while meeting those requirements. live ai is a new tool that can be easily implemented from Golang, javascript, ruby, etc.}
  spec.homepage      = "https://liveai-website.appspot.com/"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_runtime_dependency 'net'
  #spec.add_runtime_dependency 'uri'
  spec.add_runtime_dependency 'json'
  spec.add_runtime_dependency 'logger'
end
