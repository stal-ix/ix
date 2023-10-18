{% extends '//lib/placebo/5/ix.sh' %}

{% block fetch %}
https://github.com/haasn/libplacebo/archive/refs/tags/v6.338.1.tar.gz
sha:3c9a68b325c00e6f2f16d58774fd3a9bb63c0f27c10c2285438ad813b2d05ae1
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
