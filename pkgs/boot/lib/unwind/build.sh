$untar $src/llvm* && cd llvm* && cd libunwind

export CPPFLAGS="-I./src -I./include -D_LIBUNWIND_HAS_COMMENT_LIB_PRAGMA -funwind-tables -D_DEBUG -D_LIBUNWIND_IS_NATIVE_ONLY $CPPFLAGS"
export CXXFLAGS="-std=c++11 -fstrict-aliasing -fno-exceptions -fno-rtti $CXXFLAGS"
export CFLAGS="-std=c99 $CFLAGS"

mkdir obj

cxx_src=$(ls src/*.cpp)
c_srcs=$(ls src/*.c)
asm_srcs=$(ls src/*.S)

for s in $cxx_src; do
    g++ $CPPFLAGS $CFLAGS $CXXFLAGS -c $s -o obj/$(basename $s).o
done

for s in $c_srcs $asm_srcs; do
    gcc $CPPFLAGS $CFLAGS -c $s -o obj/$(basename $s).o
done

ar q obj/libunwind.a obj/*.o
ranlib obj/libunwind.a

mkdir $out/lib
cp obj/libunwind.a $out/lib
cp -R include $out/

cat << EOF > $out/env
export CPPFLAGS="-I$out/include \$CPPFLAGS"
export LDFLAGS="$out/lib/libunwind.a \$LDFLAGS"
EOF
