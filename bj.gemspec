# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "BlackJack"
  spec.version       = '1.0'
  spec.authors       = ["Silas Tolliver"]
  spec.email         = ["esttres@hotmail.com"]
  spec.summary       = %q{This is the game of BlackJack}
  spec.description   = %q{Longer description of your project.}
  spec.homepage      = "http://domainforproject.com/"
  spec.license       = "MIT"

  spec.files         = ['lib/bjlegend.rb']
  spec.executables   = ['bin/NAME']
  spec.test_files    = ['tests/test_card.rb','tests/test_deck']
  spec.require_paths = ["lib"]
end