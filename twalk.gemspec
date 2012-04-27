# -*- encoding: utf-8 -*-
require File.expand_path('../lib/twalk/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Gareth Rees"]
  gem.email         = ["gareth.h.rees@gmail.com"]
  gem.description   = %q{Twalk displays tweets of your followers who are talking to one another}
  gem.summary       = %q{Twalk displays tweets of your followers who are talking to one another}
  gem.homepage      = "http://github.com/garethrees/twalk"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "twalk"
  gem.require_paths = ["lib"]
  gem.version       = Twalk::VERSION
end
