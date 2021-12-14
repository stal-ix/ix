{% extends '//mix/template/py.py' %}

{% block env %}
setup_toolchain_env() {
    export CC=gcc
    export CXX=g++
    export AR=ar
    export NM=nm
    export RANLIB=ranlib
}

setup_toolchain() {
setup_toolchain_env

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

ln -s $(which ${AR}) ar
ln -s $(which ${NM}) nm
ln -s $(which ${RANLIB}) ranlib

ln -s cc gcc
ln -s cc c99
ln -s cc clang

ln -s c++ g++
ln -s c++ clang++

ln -s preproc cpp
ln -s preproc clang-cpp

export LDFLAGS=
export CFLAGS=
export CPPFLAGS=
export CXXFLAGS=
export CONLYFLAGS=
}
{% endblock %}
