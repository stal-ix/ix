{% extends '//mix/template/py.py' %}

{% block env %}
guess_flags() {
>_.c
>_.cpp

if ${CC} -nostdinc -fcolor-diagnostics -fdiagnostics-color -c _.c; then
    CFLAGS="-nostdinc ${CFLAGS}"
fi

if ${CXX} -nostdinc++ -c _.cpp; then
    CXXFLAGS="-nostdinc++ ${CXXFLAGS}"
fi

for ld in '-nostdlib' '-nostdlib++' '-fno-use-linker-plugin'; do
    if ${CXX} ${ld} -c _.cpp; then
        LDFLAGS="${ld} ${LDFLAGS}"
    fi
done
}

setup_tc_hard() {
C="${CPPFLAGS} ${CFLAGS} ${LDFLAGS} ${OPTFLAGS}"

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
}

setup_compiler() {
if command -v gcc; then
    export CC=gcc
fi

if command -v clang; then
    export CC=clang
fi

if command -v g++; then
    export CXX=g++
fi

if command -v c++; then
    export CXX=c++
fi

if command -v clang++; then
    export CXX=clang++
fi

if command -v cpp; then
    export CPP=cpp
fi

if command -v clang-cpp; then
    export CPP=clang-cpp
fi

if command -v ar; then
    export AR=ar
fi

if command -v llvm-ar; then
    export AR=llvm-ar
fi

if command -v nm; then
    export NM=nm
fi

if command -v llvm-nm; then
    export NM=llvm-nm
fi

if command -v ranlib; then
    export RANLIB=ranlib
fi

if command -v llvm-ranlib; then
    export RANLIB=llvm-ranlib
fi

guess_flags

if command -v ln; then
    setup_tc_hard
else
    export LDFLAGS="-w -Wl,--start-group ${LDFLAGS}"
    export CFLAGS="${CFLAGS} ${OPTFLAGS}"
    export CXXFLAGS="${CXXFLAGS} ${OPTFLAGS}"
fi

export LD=${CC}
}

setup_ar() {
    >qw
}
{% endblock %}
