{% extends '//lib/msh3/t/ix.sh' %}

{% block cmake_flags %}
{{super()}}
MSH3_TOOL=ON
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/shim/fake(lib_name=OpenSSL)
lib/shim/fake(lib_name=base_link)
{% endblock %}
