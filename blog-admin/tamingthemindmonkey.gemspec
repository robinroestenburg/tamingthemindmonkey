Gem::Specification.new do |s|
  s.name        = 'tamingthemindmonkey'
  s.version     = '0.0.0'
  s.date        = '2012-12-09'
  s.summary     = "Taming the Mind Monkey"
  s.authors     = ["Robin Roestenburg"]
  s.email       = 'robinroestenburg@gmail.com'
  s.homepage    = 'http://www.tamingthemindmonkey.com'

  s.files         = `git ls-files`.split($/)
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_dependency "sinatra", ">= 0.9.2"

  s.description = <<description
    Taming the Mind Monkey
    My Blog
description

end
