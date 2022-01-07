{% extends '//mix/template/proxy.sh' %}

{% block bld_tool %}
shell/cli/dash/minimal
dev/lang/clang/13/opt
{% endblock %}

{% block install %}
cat << EOF > ${out}/env.template
export CLANG_VERSION=${CLANG_VERSION}
export CPPFLAGS="-isystem :prefix:/lib/clang/\${CLANG_VERSION}/include \${CPPFLAGS}"
EOF

cp -R $(dirname $(which sh))/* ${out}/
cp -R $(dirname $(which clang-13))/* ${out}/
{% endblock %}
