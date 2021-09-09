$unzip $src/master* && cd libcxxrt*

mkdir obj

cxx_srcs=$(ls src/*.cc)
c_srcs=$(ls src/*.c)

for s in $cxx_srcs; do
    n=$(basename $s)
    g++ $CPPFLAGS $CFLAGS $CXXFLAGS -c $s -o obj/$n.o
done

for s in $c_srcs; do
    n=$(basename $s)
    gcc $CPPFLAGS $CFLAGS -c $s -o obj/$n.o
done

ar q obj/libcxxrt.a obj/*.o
ranlib obj/libcxxrt.a

mkdir $out/lib
mkdir $out/include

cp obj/libcxxrt.a $out/lib/
cp src/*.h $out/include/

cat << EOF > $out/env
export CPPFLAGS="-I$out/include \$CPPFLAGS"
export LDFLAGS="$out/lib/libcxxrt.a \$LDFLAGS"
EOF
