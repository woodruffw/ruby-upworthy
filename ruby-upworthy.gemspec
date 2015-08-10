require_relative './lib/upworthy.rb'

Gem::Specification.new do |s|
	s.name = 'ruby-upworthy'
	s.version = Upworthy::VERSION.dup
	s.date = '2015-08-07'
	s.required_ruby_version = '>= 1.9.0'
	s.summary = 'ruby-upworthy - Generate clickbait titles.'
	s.description = 'A Ruby translation of http://www.upworthygenerator.com/.'
	s.authors = ['William Woodruff']
	s.email = 'william@tuffbizz.com'
	s.files = Dir['LICENSE', 'README.md', '.yardopts', 'lib/**/*']
	s.executables << 'upworthy'
	s.homepage = 'https://github.com/woodruffw/ruby-upworthy'
	s.license = 'MIT'
end
