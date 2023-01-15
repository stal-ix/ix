{% extends '//lib/gmp/ix.sh' %}

{% block lib_deps %}
{{super()}}
lib/c++
{% endblock %}

{% block configure_flags %}
{{super()}}
--enable-cxx
{% endblock %}
