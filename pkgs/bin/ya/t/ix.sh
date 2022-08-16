{% extends '//die/c/ix.sh' %}

{% block step_unpack %}
cp -R {{arc_root}} src
cd src
{% endblock %}

{% block bld_tool %}
bld/python
bld/python/2
jdk/oracle/17
{% endblock %}

{% block setup %}
# {{ya_ver}}
export J1=$(which javac)
export J2=$(dirname ${J1})
export J3=$(dirname ${J2})
export LD_LIBRARY_PATH=${J3}/lib
export CLANG_DIR="$(dirname $(which clang-14))"
export CLANG_INC="$(dirname ${CLANG_DIR})/share/include"
export ARC_ROOT="${PWD}"
export BLD_ROOT="${tmp}/obj"
{% endblock %}

{% block setup_tools %}
# redefine clang wrapper with real clang(well, almost)

cat << EOF > clang
#!$(which sh)
exec "${CLANG_DIR}/clang" -isystem "${CLANG_INC}" "\$@" -w -fuse-ld=lld
EOF

cat << EOF > clang++
#!$(which sh)
exec "${CLANG_DIR}/clang++" -isystem "${CLANG_INC}" "\$@" -w -fuse-ld=lld
EOF

chmod +x clang clang++
{% endblock %}

{% block configure %}
mkdir ${BLD_ROOT}
{% endblock %}

{% block build %}
cd bootstrap
sh {% block stage %}{% endblock %} ${ARC_ROOT} ${BLD_ROOT}
{% endblock %}

{% block install %}
mkdir ${out}/bin
cd ${BLD_ROOT}
cp ymake ${out}/bin/
cp ya-bin ${out}/bin/
{% endblock %}
