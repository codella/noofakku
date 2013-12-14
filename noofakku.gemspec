Gem::Specification.new do |s|
  s.name        = 'noofakku'
  s.version     = `git tag`.split("\n")[0]
  s.date        = '2013-12-08'
  s.summary     = "Noofakku"
  s.description = "A simple brainfuck implementation"
  s.authors     = ["Mauro Codella"]
  s.email       = 'mauro.codella@gmail.com'
  s.files       = ["lib/noofakku.rb"]
  s.homepage    = 'http://github.com/mcodella/noofakku'
  s.license     = 'MIT'
end
