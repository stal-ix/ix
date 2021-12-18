{% extends '//mix/template/py.py' %}

{% block env %}
setup_compiler() {
export CC=gcc
export CPP=cpp
export CXX=g++

C="-fdiagnostics-color -nostdinc -nostdlib ${CPPFLAGS} ${CFLAGS} ${LDFLAGS} ${OPTFLAGS}"

A="${CONLYFLAGS} ${C}"
B="-nostdinc++ ${CXXFLAGS} ${C}"

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
}

setup_ar() {
    export AR=ar
    export NM=nm
    export RANLIB=ranlib

    ln -s $(which ${AR}) ar
    ln -s $(which ${NM}) nm
    ln -s $(which ${RANLIB}) ranlib
}
{% endblock %}
