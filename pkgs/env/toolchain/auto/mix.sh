{% extends '//mix/template/py.py' %}

{% block env %}
guess_flags() {
>_.c
>_.cpp

if ${CC} -nostdinc -c _.c; then
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
mkdir compiler && cd compiler

C="${CPPFLAGS} ${CFLAGS} ${LDFLAGS} ${OPTFLAGS}"

A="${CONLYFLAGS} ${C}"
B="${CXXFLAGS} ${C}"

S="-Wl,--start-group"
E="-Wl,--end-group"

cat << EOF > clang
#!$(which dash)
exec "$(which ${CC})" ${S} ${A} "\$@" ${A} ${E}
EOF

cat << EOF > clang++
#!$(which dash)
exec "$(which ${CXX})" ${S} ${B} "\$@" ${B} ${E}
EOF

cat << EOF > clang-cpp
#!$(which dash)
exec "$(which ${CPP})" ${CPPFLAGS} "\$@" ${CPPFLAGS}
EOF

chmod +x clang clang++ clang-cpp

ln -s $(which ${AR}) llvm-ar
ln -s $(which ${NM}) llvm-nm
ln -s $(which ${RANLIB}) llvm-ranlib

ln -s clang cc
ln -s clang c99
ln -s clang gcc

ln -s clang++ g++
ln -s clang++ c++

ln -s clang-cpp cpp

ln -s llvm-ar ar
ln -s llvm-nm nm
ln -s llvm-ranlib ranlib

export LDFLAGS=
export CFLAGS=
export CPPFLAGS=
export CXXFLAGS=
export CONLYFLAGS=

export PATH="${PWD}:${PATH}"

cd ..
}

setup_toolchain_env() {
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

setup_toolchain() {
    setup_toolchain_env
}
{% endblock %}
