{% extends '//mix/template/template.sh' %}

{% block deps %}
# bld shell/cli/dash/minimal/package.sh
# bld dev/lang/clang/package.sh
# bld boot/final/env/tools/package.sh
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
