{% extends '//mix/template/std.sh' %}

{% block lib_deps %}
lib/mesa/mix.sh
{% endblock %}

{% block bld_tool %}
lib/dlfcn/scripts/mix.sh
{% endblock %}

{% block step_unpack %}
{% endblock %}

{% block build %}
stubs() {
    python3 "$(which gen_dl_stubs.py)" $1 {{target.os}}
}

${NM} ${lib_mesa}/lib/libfullgl.a | grep __driDriverGetExtensions | while read l; do
    stubs "$(echo ${l} | sed -e 's|.*_||')_dri" << EOF >> dl.cpp
${l}
EOF
done

stubs vulkan << EOF >> dl.cpp
fopen
EOF

# TODO(pg): if not radeon?
stubs vulkan_radeon << EOF >> dl.cpp
vk_icdGetInstanceProcAddr
vk_icdNegotiateLoaderICDInterfaceVersion
vk_icdGetPhysicalDeviceProcAddr
EOF

${CC} -c dl.cpp
{% endblock %}

{% block install %}
mkdir ${out}/lib && cp dl.o ${out}/lib/
{% endblock %}

{% block env %}
export LDFLAGS="${out}/lib/dl.o -Wl,--whole-archive -lfullgl -Wl,--no-whole-archive \${LDFLAGS}"
{% endblock %}
