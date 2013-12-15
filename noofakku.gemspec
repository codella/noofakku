Gem::Specification.new do |s|
  s.name        = 'noofakku'
  s.version     = `git describe --tags --abbrev=0`.split("\n")[0]
  s.date        = `date +"%Y-%m-%d"`
  s.summary     = "Noofakku"
  s.description = "A simple brainfuck implementation"
  s.authors     = ["Mauro Codella"]
  s.email       = 'mauro.codella@gmail.com'
  s.homepage    = 'http://github.com/mcodella/noofakku'
  s.license     = 'MIT'
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_development_dependency "rake"
  s.add_development_dependency "shoulda"
  s.add_development_dependency "coveralls"
end
