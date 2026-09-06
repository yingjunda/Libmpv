Pod::Spec.new do |s|
  s.name             = 'Libmpv'
  s.version          = '1.0.0'
  s.summary          = 'libmpv framework for iOS'
  s.description      = 'Prebuilt libmpv framework with HEVC/H.265 support for iOS video playback'
  s.homepage         = 'https://github.com/mpv-player/mpv'
  s.license          = { :type => 'LGPL-2.1', :text => 'LGPL' }
  s.author           = { 'mpv' => 'https://github.com/mpv-player/mpv' }
  s.platform         = :ios, '16.0'
  s.source           = { :git => 'https://gitee.com/dayingjuna/libmpv.git', :tag => '1.0.0' }
  s.prepare_command  = <<-CMD
    set -e
    curl -fSL --retry 3 --retry-delay 5 -o libmpv-1.0.0.xcframework.zip 'https://gitee.com/dayingjuna/libmpv/releases/download/1.0.0/libmpv-1.0.0.xcframework.zip'
    curl -fSL --retry 3 --retry-delay 5 -o Libuavs3d.xcframework.zip 'https://github.com/mpvkit/libuavs3d-build/releases/download/1.2.1-fix/Libuavs3d.xcframework.zip'
    curl -fSL --retry 3 --retry-delay 5 -o MoltenVK.xcframework.zip 'https://github.com/mpvkit/moltenvk-build/releases/download/1.4.2/MoltenVK.xcframework.zip'
    unzip -q -o libmpv-1.0.0.xcframework.zip
    unzip -q -o Libuavs3d.xcframework.zip
    unzip -q -o MoltenVK.xcframework.zip
    rm -f libmpv-1.0.0.xcframework.zip Libuavs3d.xcframework.zip MoltenVK.xcframework.zip
  CMD
  s.vendored_frameworks = ['libmpv.xcframework', 'Libuavs3d.xcframework', 'MoltenVK.xcframework']
  s.frameworks       = ['VideoToolbox', 'CoreMedia', 'CoreVideo', 'CoreAudio', 'AudioToolbox', 'AVFoundation', 'Metal', 'CoreGraphics']
  s.libraries        = ['iconv', 'xml2', 'z', 'bz2', 'lzma', 'c++']
  s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-undefined dynamic_lookup' }
  s.user_target_xcconfig = { 'OTHER_LDFLAGS' => '-undefined dynamic_lookup' }
end
