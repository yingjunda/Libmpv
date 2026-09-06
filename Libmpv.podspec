Pod::Spec.new do |s|
  s.name             = 'Libmpv'
  s.version          = '1.1.0'
  s.summary          = 'mpv media player (iOS), packaged from mpvkit/MPVKit 1.0.0 official binaries'
  s.description      = 'Full mpv + FFmpeg + Vulkan(MoltenVK) static xcframework graph, fetched from mpvkit/MPVKit 1.0.0 release assets'
  s.homepage         = 'https://github.com/mpvkit/MPVKit'
  s.license          = { :type => 'LGPL-2.1', :text => 'LGPL-2.1' }
  s.author           = { 'mpvkit' => 'https://github.com/mpvkit' }
  s.platform         = :ios, '16.0'
  s.source           = { :git => 'https://gitee.com/dayingjuna/libmpv.git', :branch => 'main' }
  s.prepare_command  = <<-CMD
    set -e
    CACHE="$HOME/.mpvkit-pods-cache"
    SWIFTPM="$HOME/Library/Caches/org.swift.swiftpm/artifacts"
    mkdir -p "$CACHE"
    fetch_unzip() {
      z="$1"; u="$2"; a="$3"
      [ -d "${z%.zip}" ] && return 0
      if [ ! -f "$z" ]; then
        src=""
        sname="$(printf "%s" "$u" | tr -c 'A-Za-z0-9' '_')"
        if [ -f "$SWIFTPM/$sname" ]; then src="$SWIFTPM/$sname"
        elif [ -f "$CACHE/$z" ]; then src="$CACHE/$z"
        fi
        if [ -n "$src" ]; then
          cp -f "$src" "$z"
        else
          curl -fSL --retry 2 --connect-timeout 15 --max-time 600 -o "$z" "$u" 2>/dev/null \
            || curl -fSL --retry 2 -L -H 'Accept: application/octet-stream' --connect-timeout 15 --max-time 600 -o "$z" "$a" 2>/dev/null
          [ -s "$z" ] || { echo "[Libmpv] download failed: $z"; exit 1; }
          cp -f "$z" "$CACHE/$z" 2>/dev/null || true
        fi
      fi
      unzip -q -o "$z"
      rm -f "$z"
    }
  fetch_unzip "Libass.xcframework.zip" "https://github.com/mpvkit/libass-build/releases/download/0.17.5/Libass.xcframework.zip" "https://api.github.com/repos/mpvkit/libass-build/releases/assets/456245701"
  fetch_unzip "Libavcodec.xcframework.zip" "https://github.com/mpvkit/MPVKit/releases/download/1.0.0/Libavcodec.xcframework.zip" "https://api.github.com/repos/mpvkit/MPVKit/releases/assets/489352809"
  fetch_unzip "Libavdevice.xcframework.zip" "https://github.com/mpvkit/MPVKit/releases/download/1.0.0/Libavdevice.xcframework.zip" "https://api.github.com/repos/mpvkit/MPVKit/releases/assets/489352814"
  fetch_unzip "Libavfilter.xcframework.zip" "https://github.com/mpvkit/MPVKit/releases/download/1.0.0/Libavfilter.xcframework.zip" "https://api.github.com/repos/mpvkit/MPVKit/releases/assets/489352810"
  fetch_unzip "Libavformat.xcframework.zip" "https://github.com/mpvkit/MPVKit/releases/download/1.0.0/Libavformat.xcframework.zip" "https://api.github.com/repos/mpvkit/MPVKit/releases/assets/489352819"
  fetch_unzip "Libavutil.xcframework.zip" "https://github.com/mpvkit/MPVKit/releases/download/1.0.0/Libavutil.xcframework.zip" "https://api.github.com/repos/mpvkit/MPVKit/releases/assets/489352820"
  fetch_unzip "Libbluray.xcframework.zip" "https://github.com/mpvkit/libbluray-build/releases/download/1.4.0/Libbluray.xcframework.zip" "https://api.github.com/repos/mpvkit/libbluray-build/releases/assets/331740527"
  fetch_unzip "Libcrypto.xcframework.zip" "https://github.com/mpvkit/openssl-build/releases/download/3.3.5/Libcrypto.xcframework.zip" "https://api.github.com/repos/mpvkit/openssl-build/releases/assets/331687037"
  fetch_unzip "Libdav1d.xcframework.zip" "https://github.com/mpvkit/libdav1d-build/releases/download/1.5.3/Libdav1d.xcframework.zip" "https://api.github.com/repos/mpvkit/libdav1d-build/releases/assets/339947241"
  fetch_unzip "Libdovi.xcframework.zip" "https://github.com/mpvkit/libdovi-build/releases/download/3.3.2/Libdovi.xcframework.zip" "https://api.github.com/repos/mpvkit/libdovi-build/releases/assets/331680719"
  fetch_unzip "Libfreetype.xcframework.zip" "https://github.com/mpvkit/libass-build/releases/download/0.17.5/Libfreetype.xcframework.zip" "https://api.github.com/repos/mpvkit/libass-build/releases/assets/456245703"
  fetch_unzip "Libfribidi.xcframework.zip" "https://github.com/mpvkit/libass-build/releases/download/0.17.5/Libfribidi.xcframework.zip" "https://api.github.com/repos/mpvkit/libass-build/releases/assets/456245707"
  fetch_unzip "Libharfbuzz.xcframework.zip" "https://github.com/mpvkit/libass-build/releases/download/0.17.5/Libharfbuzz.xcframework.zip" "https://api.github.com/repos/mpvkit/libass-build/releases/assets/456245699"
  fetch_unzip "Libmpv.xcframework.zip" "https://github.com/mpvkit/MPVKit/releases/download/1.0.0/Libmpv.xcframework.zip" "https://api.github.com/repos/mpvkit/MPVKit/releases/assets/489352811"
  fetch_unzip "Libplacebo.xcframework.zip" "https://github.com/mpvkit/libplacebo-build/releases/download/7.360.1/Libplacebo.xcframework.zip" "https://api.github.com/repos/mpvkit/libplacebo-build/releases/assets/373603673"
  fetch_unzip "Libshaderc_combined.xcframework.zip" "https://github.com/mpvkit/libshaderc-build/releases/download/2025.5.0/Libshaderc_combined.xcframework.zip" "https://api.github.com/repos/mpvkit/libshaderc-build/releases/assets/331752143"
  fetch_unzip "Libssl.xcframework.zip" "https://github.com/mpvkit/openssl-build/releases/download/3.3.5/Libssl.xcframework.zip" "https://api.github.com/repos/mpvkit/openssl-build/releases/assets/331687036"
  fetch_unzip "Libswresample.xcframework.zip" "https://github.com/mpvkit/MPVKit/releases/download/1.0.0/Libswresample.xcframework.zip" "https://api.github.com/repos/mpvkit/MPVKit/releases/assets/489352807"
  fetch_unzip "Libswscale.xcframework.zip" "https://github.com/mpvkit/MPVKit/releases/download/1.0.0/Libswscale.xcframework.zip" "https://api.github.com/repos/mpvkit/MPVKit/releases/assets/489352803"
  fetch_unzip "Libuavs3d.xcframework.zip" "https://github.com/mpvkit/libuavs3d-build/releases/download/1.2.1-fix/Libuavs3d.xcframework.zip" "https://api.github.com/repos/mpvkit/libuavs3d-build/releases/assets/489098713"
  fetch_unzip "Libuchardet.xcframework.zip" "https://github.com/mpvkit/libuchardet-build/releases/download/0.0.8/Libuchardet.xcframework.zip" "https://api.github.com/repos/mpvkit/libuchardet-build/releases/assets/403507736"
  fetch_unzip "Libunibreak.xcframework.zip" "https://github.com/mpvkit/libass-build/releases/download/0.17.5/Libunibreak.xcframework.zip" "https://api.github.com/repos/mpvkit/libass-build/releases/assets/456245702"
  fetch_unzip "MoltenVK.xcframework.zip" "https://github.com/mpvkit/moltenvk-build/releases/download/1.4.2/MoltenVK.xcframework.zip" "https://api.github.com/repos/mpvkit/moltenvk-build/releases/assets/489146037"
  fetch_unzip "gmp.xcframework.zip" "https://github.com/mpvkit/gnutls-build/releases/download/3.8.11/gmp.xcframework.zip" "https://api.github.com/repos/mpvkit/gnutls-build/releases/assets/331699318"
  fetch_unzip "gnutls.xcframework.zip" "https://github.com/mpvkit/gnutls-build/releases/download/3.8.11/gnutls.xcframework.zip" "https://api.github.com/repos/mpvkit/gnutls-build/releases/assets/331699319"
  fetch_unzip "hogweed.xcframework.zip" "https://github.com/mpvkit/gnutls-build/releases/download/3.8.11/hogweed.xcframework.zip" "https://api.github.com/repos/mpvkit/gnutls-build/releases/assets/331699320"
  fetch_unzip "lcms2.xcframework.zip" "https://github.com/mpvkit/lcms2-build/releases/download/2.17.0/lcms2.xcframework.zip" "https://api.github.com/repos/mpvkit/lcms2-build/releases/assets/331729752"
  fetch_unzip "nettle.xcframework.zip" "https://github.com/mpvkit/gnutls-build/releases/download/3.8.11/nettle.xcframework.zip" "https://api.github.com/repos/mpvkit/gnutls-build/releases/assets/331699317"
  CMD
  s.vendored_frameworks = [
'Libass',
    'Libavcodec',
    'Libavdevice',
    'Libavfilter',
    'Libavformat',
    'Libavutil',
    'Libbluray',
    'Libcrypto',
    'Libdav1d',
    'Libdovi',
    'Libfreetype',
    'Libfribidi',
    'Libharfbuzz',
    'Libmpv',
    'Libplacebo',
    'Libshaderc_combined',
    'Libssl',
    'Libswresample',
    'Libswscale',
    'Libuavs3d',
    'Libuchardet',
    'Libunibreak',
    'MoltenVK',
    'gmp',
    'gnutls',
    'hogweed',
    'lcms2',
    'nettle',
  ]
  s.frameworks = ['AVFoundation', 'AudioToolbox', 'CoreAudio', 'CoreVideo', 'CoreFoundation', 'CoreMedia', 'Metal', 'QuartzCore', 'VideoToolbox', 'UIKit', 'Foundation', 'CoreGraphics']
  s.libraries  = ['z', 'bz2', 'iconv', 'xml2', 'c++', 'resolv', 'expat', 'lzma']
  s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-undefined dynamic_lookup' }
  s.user_target_xcconfig = { 'OTHER_LDFLAGS' => '-undefined dynamic_lookup' }
end
