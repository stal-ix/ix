(
    mkdir -p base/trace_event/common
    cd base/trace_event/common
    extract ${src}/68d816952258c9d817bba656ee2664b35507f01b.tar.gz
)

(
    mkdir -p build
    cd build
    extract ${src}/f78b0bd09847b94e9ec9cb520855d6785fd082ab.tar.gz
)

(
    mkdir -p buildtools
    cd buildtools
    extract ${src}/a9bc3e283182a586998338a665c7eae17406ec54.tar.gz
)

(
    mkdir -p buildtools/clang_format/script
    cd buildtools/clang_format/script
    extract ${src}/99876cacf78329e5f99c244dbe42ccd1654517a0.tar.gz
)

(
    mkdir -p buildtools/third_party/libc++/trunk
    cd buildtools/third_party/libc++/trunk
    extract ${src}/79a2e924d96e2fc1e4b937c42efd08898fa472d7.tar.gz
)

(
    mkdir -p buildtools/third_party/libc++abi/trunk
    cd buildtools/third_party/libc++abi/trunk
    extract ${src}/9eb0245224c2d7f6b20f76d4d24eab1d60a2b281.tar.gz
)

(
    mkdir -p buildtools/third_party/libunwind/trunk
    cd buildtools/third_party/libunwind/trunk
    extract ${src}/557b51a0ccab9b3dbce61bdd57aa5f7d5c7c6206.tar.gz
)

(
    mkdir -p test/benchmarks/data
    cd test/benchmarks/data
    extract ${src}/05d7188267b4560491ff9155c5ee13e207ecd65f.tar.gz
)

(
    mkdir -p test/mozilla/data
    cd test/mozilla/data
    extract ${src}/f6c578a10ea707b1a8ab0b88943fe5115ce2b9be.tar.gz
)

(
    mkdir -p test/test262/data
    cd test/test262/data
    extract ${src}/8d420cef415f3501cb24d674b8c032d1f09402a0.tar.gz
)

(
    mkdir -p test/test262/harness
    cd test/test262/harness
    extract ${src}/278bcfaed0dcaa13936831fb1769d15e7c1e3b2b.tar.gz
)

(
    mkdir -p third_party/depot_tools
    cd third_party/depot_tools
    extract ${src}/756e98f5aac7fb163e558a5a5cc5f3dc0098b1d7.tar.gz
)

(
    mkdir -p third_party/google_benchmark/src
    cd third_party/google_benchmark/src
    extract ${src}/1e3ab7fa434d1b4aebdd22b760dbf99c498ae7cd.tar.gz
)

(
    mkdir -p third_party/googletest/src
    cd third_party/googletest/src
    extract ${src}/075810f7a20405ea09a93f68847d6e963212fa62.tar.gz
)

(
    mkdir -p third_party/icu
    cd third_party/icu
    extract ${src}/4df07a2d158218b77369b82f9fe3190725beb815.tar.gz
)

(
    mkdir -p third_party/instrumented_libraries
    cd third_party/instrumented_libraries
    extract ${src}/6527a4e98a746f5324e21e813a41af25419bfae7.tar.gz
)

(
    mkdir -p third_party/jinja2
    cd third_party/jinja2
    extract ${src}/ee69aa00ee8536f61db6a451f3858745cf587de6.tar.gz
)

(
    mkdir -p third_party/jsoncpp/source
    cd third_party/jsoncpp/source
    extract ${src}/9059f5cad030ba11d37818847443a53918c327b1.tar.gz
)

(
    mkdir -p third_party/logdog/logdog
    cd third_party/logdog/logdog
    extract ${src}/17ec234f823f7bff6ada6584fdbbee9d54b8fc58.tar.gz
)

(
    mkdir -p third_party/markupsafe
    cd third_party/markupsafe
    extract ${src}/1b882ef6372b58bfd55a3285f37ed801be9137cd.tar.gz
)

(
    mkdir -p third_party/perfetto
    cd third_party/perfetto
    extract ${src}/aa4385bc5997ecad4c633885e1b331b1115012fb.tar.gz
)

(
    mkdir -p third_party/protobuf
    cd third_party/protobuf
    extract ${src}/6a59a2ad1f61d9696092f79b6d74368b4d7970a3.tar.gz
)

(
    mkdir -p third_party/zlib
    cd third_party/zlib
    extract ${src}/6da1d53b97c89b07e47714d88cab61f1ce003c68.tar.gz
)

(
    mkdir -p tools/clang
    cd tools/clang
    extract ${src}/c00aa10009548ad073810d810cc4a71d2965f75b.tar.gz
)
