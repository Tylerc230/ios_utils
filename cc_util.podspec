Pod::Spec.new do |s|
s.name     = 'cc_util'
s.version  = '1.1'
s.license  = 'GPL'
s.summary  = 'A collection of helper classes and categories used for day to day iOS development.'
s.homepage = 'https://github.com/Tylerc230/ios_utils.git'
s.author   = { 'Tyler Casselman' => '' }

s.source   = { :git => 'https://github.com/Tylerc230/ios_utils.git', :tag => '1.1' }
s.requires_arc = true

s.description = 'Small collection of utility classes and categories to make my life easier.'

s.platform = :ios
s.source_files = '**/*.{m,h}'
end
