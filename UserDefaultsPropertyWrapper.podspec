Pod::Spec.new do |s|
  s.name      = "UserDefaultsPropertyWrapper"
  s.version   = "1.0.0"
  s.swift_version = "4.0"
  s.summary   = "UserDefaults @propertyWrapper class."
  s.description  = "Property wrapper class that allows you to create properties that are stored in user defaults and makes it easy to work with them."
  s.homepage  = "https://github.com/idapgroup/UserDefaultsPropertyWrapper"
  s.license   = { :type => "New BSD", :file => "LICENSE" }
  s.author    = { "IDAP Group" => "hello@idapgroup.com" }
  s.source    = { :git => "https://github.com/idapgroup/UserDefaultsPropertyWrapper.git",
                  :tag => s.version.to_s }

  # Platform setup
  s.requires_arc          = true
  s.ios.deployment_target = '9.0'

  # Preserve the layout of headers in the Module directory
  s.header_mappings_dir   = 'Source'
  s.source_files          = 'Source/**/*.{swift,h,m,c,cpp}'
end
