{% extends '//lib/clc/t/ix.sh' %}

{% block fetch %}
{% include '//lib/llvm/23/ver.sh' %}
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/llvm/23
{% endblock %}

{% block bld_tool %}
{{super()}}
bin/clang/23(multicall=)
{% endblock %}

{% block ninja_build_dir %}
${tmp}/obj-${LIBCLC_TARGET}
{% endblock %}

{% block cmake_flags %}
{{super()}}
LLVM_RUNTIMES_TARGET=${LIBCLC_TARGET}
LLVM_DEFAULT_TARGET_TRIPLE=${LIBCLC_TARGET}
LIBCLC_USE_SPIRV_BACKEND=ON
{% endblock %}

{% block configure %}
for libclc_target in spirv32-unknown-unknown spirv64-unknown-unknown; do
    LIBCLC_TARGET=${libclc_target}
    {{super()}}
done
{% endblock %}

{% block build %}
for libclc_target in spirv32-unknown-unknown spirv64-unknown-unknown; do
    ninja -C ${tmp}/obj-${libclc_target} -j ${make_thrs}
done
{% endblock %}

{% block install %}
for libclc_target in spirv32-unknown-unknown spirv64-unknown-unknown; do
    ninja -C ${tmp}/obj-${libclc_target} install
done
{% endblock %}

{% block postinstall %}
cp ${out}/share/clc/spirv32-unknown-unknown/libclc.spv \
    ${out}/share/clc/spirv-mesa3d-.spv
cp ${out}/share/clc/spirv64-unknown-unknown/libclc.spv \
    ${out}/share/clc/spirv64-mesa3d-.spv

mkdir -p ${out}/share/pkgconfig
cat <<EOF > ${out}/share/pkgconfig/libclc.pc
libexecdir=${out}/share/clc

Name: libclc
Description: Library requirements of the OpenCL C programming language
Version: 23.1.3
Libs: -L\${libexecdir}
EOF
{% endblock %}
