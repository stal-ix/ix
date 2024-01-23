{% extends '//lib/placebo/5/ix.sh' %}

{% block fetch %}
https://github.com/haasn/libplacebo/archive/refs/tags/v6.338.2.tar.gz
sha:2f1e624e09d72a8c9db70f910f7560e764a1c126dae42acc5b3bcef836a7aec6
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
