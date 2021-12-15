{% extends '//dev/lang/byacc/mix.sh' %}

{% block configure_flags %}
--enable-btyacc
{% endblock %}

{% block bld_libs %}
lib/c/mix.sh
{% endblock %}
