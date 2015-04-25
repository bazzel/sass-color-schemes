Gem::Specification.new do |s|
  # Release Specific Information
  s.version       = '0.1.0'
  s.licenses      = ['MIT']
  s.date          = '2014-04-24'

  # Gem Details
  s.name          = 'sass-color-schemes'
  s.authors       = ['Patrick Baselier']
  s.email         = ['patrick.baselier@gmail.com']

  s.summary       = %q{Lorem Ipsum}
  s.description   = %q{Extended Lorem Ipsum}
  s.homepage      = "https://github.com/bazzel"

  # Gem Files
  s.files = %w(README.md)
  s.files += Dir.glob('lib/**/*.*')
  s.files += Dir.glob('stylesheets/**/*.*')
  s.files += Dir.glob('templates/**/*.*')

  # Gem Bookkeeping
  s.rubygems_version = %q{1.3.6}
  s.add_dependency('compass', ['~> 1.0'])
  s.add_dependency('color-schemer', ['~> 0.2.8'])
end
