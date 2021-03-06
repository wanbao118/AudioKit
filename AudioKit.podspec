Pod::Spec.new do |spec|
    spec.name                     = 'AudioKit'
    spec.version                  = '1.2-01'
    spec.authors                  = { 'Aurelius Prochazka' => 'audiokit@audiokit.io' }
    spec.license                  = { :type => 'LGPL' }
    spec.homepage                 = 'http://audiokit.io/'
    spec.source                   = { :git => 'https://github.com/audiokit/AudioKit.git', :tag => 'v1.2-01-04-2015' }
    spec.summary                  = 'Open-source audio synthesis, processing, & analysis platform.'

    spec.source_files             = 'AudioKit/Core Classes/**/*.{h,m}',
                                    'AudioKit/Operations/**/*.{h,m}',
                                    'AudioKit/Parameters/**/*.{h,m}',
                                    'AudioKit/Utilities/**/*.{h,m}'

    spec.osx.deployment_target    = '10.10'
    spec.osx.frameworks           = 'CsoundLib64'
    spec.osx.vendored_frameworks  = 'AudioKit/Libraries/OSX/csound-OSX/CsoundLib64.framework'
    spec.osx.source_files         = 'AudioKit/Libraries/OSX/*.{h,m}',
                                    'AudioKit/Libraries/OSX/csound-OSX/*.{h,m}'

    spec.ios.deployment_target    = '8.0'
    spec.ios.libraries            = 'csound', 'sndfile'
    spec.ios.vendored_libraries   = 'AudioKit/Libraries/iOS/csound-iOS/libs/libcsound.a', 'AudioKit/Libraries/iOS/csound-iOS/libs/libsndfile.a'
    spec.ios.source_files         = 'AudioKit/Libraries/iOS/*.{h,m}',
                                    'AudioKit/Libraries/iOS/csound-iOS/classes/*.{h,m}',
                                    'AudioKit/Libraries/iOS/csound-iOS/headers/*.{h,hpp}'
end
