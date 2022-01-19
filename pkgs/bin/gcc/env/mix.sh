{% extends '//mix/template/py.py' %}

{% block env %}
setup_compiler() {
mkdir xx

ln -s $(which {{target.gnu.three}}ld) xx/ld

export CC=gcc
export CPP=cpp
export CXX=g++

BD="-B${PWD}/xx -B$(dirname $(which {{target.gnu.three}}as))/{{target.gnu.three}}"

C="-fdiagnostics-color -nostdinc -nostdlib ${CPPFLAGS} ${CFLAGS} ${LDFLAGS} ${OPTFLAGS}"

A="${CONLYFLAGS} ${C}"
B="-nostdinc++ ${CXXFLAGS} ${C}"

S="-Wl,--start-group"
E="-Wl,--end-group"

cat << EOF > cc
#!$(which sh)
exec "$(which {{target.gnu.three}}${CC})" ${BD} ${S} ${A} "\$@" ${A} ${E}
EOF

cat << EOF > c++
#!$(which sh)
exec "$(which {{target.gnu.three}}${CXX})" ${BD} ${S} ${B} "\$@" ${B} ${E}
EOF

cat << EOF > preproc
#!$(which sh)
exec "$(which {{target.gnu.three}}${CPP})" ${CPPFLAGS} "\$@" ${CPPFLAGS}
EOF

chmod +x cc c++ preproc
}

setup_ar() {
    export AR=ar
    export NM=nm
    export RANLIB=ranlib

    ln -s $(which {{target.gnu.three}}${AR}) ar
    ln -s $(which {{target.gnu.three}}${NM}) nm
    ln -s $(which {{target.gnu.three}}${RANLIB}) ranlib
}
{% endblock %}
