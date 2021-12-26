{% extends '//mix/template/c_std.sh' %}

{% block fetch %}
https://www.antlr.org/download/antlr-4.9-complete.jar
be31e2ab97ad66b404425e2794673bee
{% endblock %}

{% block step_unpack %}
: use prepacked dir
{% endblock %}

{% block bld_tool %}
dev/tool/python/mix.sh
dev/tool/python/2/mix.sh
dev/jdk/oracle/17/mix.sh
{% endblock %}

{% block c_compiler %}
dev/lang/clang/12/mix.sh
{% endblock %}

{% block setup %}
# {{ya_ver}}

export CLANG_DIR="$(dirname $(which clang-12))"
export CLANG_INC="$(dirname ${CLANG_DIR})/share/include"
export ARC_ROOT="{{arc_root}}"
export BLD_ROOT="${tmp}/obj"
{% endblock %}

{% block setup_tools %}
# redefine clang wrapper with real clang(well, almost)

cat << EOF > clang
#!$(which dash)
exec "${CLANG_DIR}/clang" -isystem "${CLANG_INC}" "\$@" -w -fuse-ld=lld
EOF

cat << EOF > clang++
#!$(which dash)
exec "${CLANG_DIR}/clang++" -isystem "${CLANG_INC}" "\$@" -w -fuse-ld=lld
EOF

chmod +x clang clang++
{% endblock %}

{% block build %}
cd ${ARC_ROOT}/devtools/bootstrap
mkdir ${BLD_ROOT}
cp ${src}/antlr* ${BLD_ROOT}/antlr-4.9-complete.jar
dash {% block stage %}{% endblock %} ${ARC_ROOT} ${BLD_ROOT}
{% endblock %}

{% block install %}
mkdir ${out}/bin

cd ${BLD_ROOT}

cp ymake ${out}/bin/
cp ya-bin ${out}/bin/
{% endblock %}
