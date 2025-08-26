{% extends '//lib/placebo/5/ix.sh' %}

{% block pkg_name %}
libplacebo
{% endblock %}

{% block version %}
6.338.2
{% endblock %}

{% block fetch %}
https://github.com/haasn/libplacebo/archive/refs/tags/v{{self.version().strip()}}.tar.gz
2f1e624e09d72a8c9db70f910f7560e764a1c126dae42acc5b3bcef836a7aec6
{% endblock %}

{% block lib_deps %}
lib/xxhash
lib/fast/float
{% if vulkan %}
lib/spirv/cross
{% endif %}
{{super()}}
{% endblock %}
