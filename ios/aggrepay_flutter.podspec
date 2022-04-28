#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint aggrepay_flutter.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'aggrepay_flutter'
  s.version          = '0.0.1'
  s.summary          = 'A new flutter plugin project.'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = "Classes", "Classes/**/*.{h,m}"
  s.public_header_files = "Classes/**/*.h"
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'
  s.preserve_paths = 'TraknPayObjC.framework'

  

  # Flutter.framework does not contain a i386 slice.
  # s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386 arm64' }
  s.swift_version = '5.0'
  s.ios.vendored_frameworks = 'TraknPayObjC.framework'
end


# spec.ios.vendored_frameworks = "FoloosiSdk.xcframework"

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  # spec.source_files  = "Classes", "Classes/**/*.{h,m}"
  # spec.exclude_files = "Classes/Exclude"

  # spec.public_header_files = "Classes/**/*.h"