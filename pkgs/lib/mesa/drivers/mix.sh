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

(
    set -eu

    llvm-nm ${MESA_DRIVERS} | grep __driDriverGetExtensions
) | stubs opengl > dl.cpp

stubs vulkan_intel << EOF >> dl.cpp
fopen
EOF

stubs vulkan_lvp << EOF >> dl.cpp
fopen
EOF

# TODO(pg): if not radeon?
stubs vulkan_radeon << EOF >> dl.cpp
vkGetInstanceProcAddr
vk_icdGetInstanceProcAddr
vk_icdNegotiateLoaderICDInterfaceVersion
vk_icdGetPhysicalDeviceProcAddr
EOF

cat dl.cpp

cc -c dl.cpp
{% endblock %}

{% block install %}
mkdir ${out}/lib && cp dl.o ${out}/lib/dl.o
{% endblock %}

{% block env %}
export LDFLAGS="${out}/lib/dl.o ${MESA_DRIVERS} \${LDFLAGS}"
{% endblock %}
