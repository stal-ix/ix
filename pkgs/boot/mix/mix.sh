{% extends '//mix/template/template.sh' %}

{% block bld_deps %}
shell/cli/dash/minimal/mix.sh
dev/lang/clang/mix.sh
boot/final/env/tools/mix.sh
{% endblock %}

{% block unpack %}
{% endblock %}

{% block install %}
cat << EOF > ${out}/env.template
export CLANG_VERSION=${CLANG_VERSION}
export CPPFLAGS="-isystem :prefix:/lib/clang/\${CLANG_VERSION}/include \${CPPFLAGS}"
EOF

cp -R ${shell_dash_minimal}/* ${out}/
cp -R ${dev_lang_clang}/* ${out}/
{% endblock %}
