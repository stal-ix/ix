$untar $src/llvm* && cd llvm* && cd libcxx

CPPFLAGS="-w -D_LIBCPP_BUILDING_LIBRARY -D_LIBCPP_HAS_NO_PRAGMA_SYSTEM_HEADER -iquote src -I$out/include -DLIBCXXRT -std=c++14 $CPPFLAGS"

cp -R include $out

cat << EOF > $out/include/__config_site
#if !defined(uiygfuiertyuiwetuyt)
#define uiygfuiertyuiwetuyt
#define _LIBCPP_HAS_MERGED_TYPEINFO_NAMES_DEFAULT 0
#endif
EOF

mkdir obj

SRCS1=$(ls src/*.cpp)
SRCS2=$(ls src/filesystem/*.cpp)

(
for s in $SRCS1 $SRCS2; do
    out=$(echo $s | tr '/' '_' | tr -d '\n').o
    g++ $CPPFLAGS $CFLAGS $CXXFLAGS -c $s -o obj/$out
done
)

ar q obj/libc++.a obj/*.o
ranlib obj/libc++.a

mkdir $out/lib && cp obj/libc++.a $out/lib/

cat << EOF > $out/env
export CPPFLAGS="-I$out/include \$CPPFLAGS"
export LDFLAGS="$out/lib/libc++.a \$LDFLAGS -lpthread -ldl"
EOF

(
    . $out/env

    cat << EOF > qw.cpp
#include <iostream>

int main() {
    std::cout << "helo" << std::endl;
}
EOF

    clang++ $CPPFLAGS $CXXFLAGS ./qw.cpp $LDFLAGS

    ./a.out
)
