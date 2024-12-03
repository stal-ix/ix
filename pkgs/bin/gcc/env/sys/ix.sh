{% extends '//die/env.sh' %}

{% block env %}
setup_compiler() {
export CC=gcc
export CPP=cpp
export CXX=g++

C="-fdiagnostics-color -nodefaultlibs -static -nostartfiles -nostdinc -nostdlib ${CPPFLAGS} ${CFLAGS} ${LDFLAGS} ${OPTFLAGS}"

A="${CONLYFLAGS} ${C}"
B="-nostdinc++ ${CXXFLAGS} ${C}"

S="-Wl,--start-group"
E="-Wl,--end-group"

cat << EOF > cc
#!$(which sh)
exec "$(which ${CC})" ${CTRFLAGS} "\$@" ${S} ${A} ${E}
EOF

cat << EOF > c++
#!$(which sh)
exec "$(which ${CXX})" ${CTRFLAGS} "\$@" ${S} ${B} ${E}
EOF

cat << EOF > preproc
#!$(which sh)
exec "$(which ${CPP})" ${CTRFLAGS} "\$@" ${CPPFLAGS}
EOF

chmod +x cc c++ preproc
}

setup_ar() {
    export AR=ar
    export NM=nm
    export LD=ld
    export RANLIB=ranlib
    export OBJCOPY=objcopy
    export OBJDUMP=objdump
    export STRIP=strip

    ln -s $(which ar) ar
    ln -s $(which nm) nm
    ln -s $(which ranlib) ranlib
}
{% endblock %}
