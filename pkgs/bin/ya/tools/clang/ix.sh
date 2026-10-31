{% extends '//die/gen.sh' %}

{% block bld_tool %}
bld/compiler
{% endblock %}

{% block run_deps %}
bld/compiler
{% endblock %}

{% block install %}
cd ${out}; mkdir bin; cd bin

cat << EOF > clang
#!/usr/bin/env sh
YA_C_FLAGS="{{ya_c_flags}}"
FREESTANDING_CLANG="$(command -v ${FREESTANDING_CLANG})"
CLANG_HEADERS="${CLANG_HEADERS}"
EOF

base64 -d << EOF >> clang
{% include 'clang.sh/base64' %}
EOF

cp clang clang++

for tool in llvm-ar llvm-nm llvm-objcopy llvm-objdump llvm-strip ld.lld; do
    tool_dir=$(dirname "$(readlink -f "$(command -v ${tool})")")
    test -x "${tool_dir}/${tool}"
    cat << EOF > "${tool}"
#!/usr/bin/env sh
exec "${tool_dir}/${tool}" "\${@}"
EOF
done
chmod +x *
{% endblock %}

{% block env %}
export YA_CLANG_DIR=${out}
{% endblock %}
