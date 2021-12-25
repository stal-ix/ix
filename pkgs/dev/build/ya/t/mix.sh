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
{% endblock %}

{% block c_compiler %}
dev/lang/clang/12/mix.sh
{% endblock %}

{% block setup %}
export LDFLAGS="-Wl,-z,stack-size=2097152 ${LDFLAGS}"
export ARC_ROOT="{{arc_root}}"
export BLD_ROOT="${tmp}/obj"
{% endblock %}

{% block setup_tools %}
cat << EOF > clang
#!$(which dash)
${B_dev_lang_clang}/bin/clang -isystem ${B_dev_lang_clang}/share/include "\$@" -Wno-unused-command-line-argument -fuse-ld=lld
EOF

cat << EOF > clang++
#!$(which dash)
${B_dev_lang_clang}/bin/clang++ -isystem ${B_dev_lang_clang}/share/include "\$@" -Wno-unused-command-line-argument -fuse-ld=lld
EOF

chmod +x clang clang++
{% endblock %}

{% block build %}
cd ${ARC_ROOT}/junk/pg/boot
mkdir ${BLD_ROOT}
cp ${src}/antlr* ${BLD_ROOT}/antlr-4.9-complete.jar
{% endblock %}

{% block install %}
mkdir ${out}/bin

cd ${BLD_ROOT}

cp ymake ${out}/bin/
cp ya-bin ${out}/bin/
{% endblock %}
