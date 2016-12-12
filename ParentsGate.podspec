
Pod::Spec.new do |s|


s.name         = "ParentsGate"
s.version      = "1.0.4"
s.summary      = "A short description of ParentsGate."
s.description  = "ParentsGate"

s.homepage     = "https://vk.com/mybraingames"
s.license      = "MIT"
s.authors      = "LG"
s.platform     = :ios, "9.0"

s.source       = { :git => "https://github.com/GrebeniukLA/ParentsGate", :tag => "1.0.4" }

# { :path => '.' }
#{ :git => "http://EXAMPLE/ParentsGate.git", :tag => "#{s.version}" }

s.source_files  = "ParentsGate", "ParentsGate/**/*.{h,m,swift,xib,xcassets}"
s.resources = "ParentsGate/ParentsAssets/*.xcassets"

s.resource_bundle = { 'MyKit' => 'ParentsGate/**/*.xcassets' }

#s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3' }

end
