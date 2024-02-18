{% extends 't/ix.sh' %}

{% block lib_deps %}
{{super()}}
lib/z
lib/openssl
lib/ucontext
{% endblock %}

{% block bld_tool %}
{{super()}}
bin/capnc
{% endblock %}

{% block cmake_flags %}
{{super()}}
EXTERNAL_CAPNP=ON
{% endblock %}
