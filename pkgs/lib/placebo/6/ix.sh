{% extends '//lib/placebo/5/ix.sh' %}

{% block fetch %}
https://github.com/haasn/libplacebo/archive/refs/tags/v6.338.0.tar.gz
sha:da90faa923e49ee0d1256b0c0cc37c72961acf897851d9af66a26d4aafe724bb
{% endblock %}

{% block lib_deps %}
lib/xxhash
lib/fast/float
lib/vulkan/spirv/cross
{{super()}}
{% endblock %}

{% block bld_libs %}
lib/shim/fake/pkg(pkg_name=spirv-cross-c-shared,pkg_ver=1.3.261)
{{super()}}
{% endblock %}
