{% extends '//mix/template/proxy.sh' %}

{% block bld_tool %}
bld/sh
bld/compiler
{% endblock %}

{% block install %}
cat << EOF > ${out}/env.template
export CLANG_VERSION=${CLANG_VERSION}
export CPPFLAGS="-isystem :prefix:/lib/clang/\${CLANG_VERSION}/include \${CPPFLAGS}"
EOF

cp -R $(dirname $(which sh))/* ${out}/
cp -R $(dirname $(which clang-13))/* ${out}/
{% endblock %}
