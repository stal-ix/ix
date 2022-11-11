{% extends '//lib/boehmgc/t/ix.sh' %}

{% block lib_deps %}
lib/c++
{{super()}}
{% endblock %}

{% block cmake_flags %}
{{super()}}
enable_cplusplus=ON
{% endblock %}
