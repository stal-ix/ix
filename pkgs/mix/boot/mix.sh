{% extends '//mix/template/proxy.sh' %}

{% block bld_tool %}
shell/cli/dash/minimal/mix.sh
dev/lang/clang/13/opt/mix.sh
{% endblock %}

{% block install %}
cat << EOF > ${out}/env.template
export CLANG_VERSION=${CLANG_VERSION}
export CPPFLAGS="-isystem :prefix:/lib/clang/\${CLANG_VERSION}/include \${CPPFLAGS}"
EOF

cp -R $(dirname $(which dash))/* ${out}/
cp -R $(dirname $(which clang-13))/* ${out}/
{% endblock %}
