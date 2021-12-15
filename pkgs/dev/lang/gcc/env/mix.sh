{% extends '//mix/template/py.py' %}

{% block env %}
setup_compiler() {
export CC=gcc
export CXX=g++

C="-fdiagnostics-color -nostdinc -nostdinc++ -nostdlib ${CPPFLAGS} ${CFLAGS} ${LDFLAGS} ${OPTFLAGS}"

A="${CONLYFLAGS} ${C}"
B="${CXXFLAGS} ${C}"

S="-Wl,--start-group"
E="-Wl,--end-group"

cat << EOF > cc
#!$(which dash)
exec "$(which ${CC})" ${S} ${A} "\$@" ${A} ${E}
EOF

cat << EOF > c++
#!$(which dash)
exec "$(which ${CXX})" ${S} ${B} "\$@" ${B} ${E}
EOF

cat << EOF > preproc
#!$(which dash)
exec "$(which ${CPP})" ${CPPFLAGS} "\$@" ${CPPFLAGS}
EOF

chmod +x cc c++ preproc

ln -s cc gcc
ln -s cc c99
ln -s cc clang

ln -s c++ g++
ln -s c++ clang++

ln -s preproc cpp
ln -s preproc clang-cpp
}

setup_ar() {
    export AR=ar
    export NM=nm
    export RANLIB=ranlib

    ln -s $(which ${AR}) llvm-ar
    ln -s $(which ${NM}) llvm-nm
    ln -s $(which ${RANLIB}) llvm-ranlib
}
{% endblock %}
