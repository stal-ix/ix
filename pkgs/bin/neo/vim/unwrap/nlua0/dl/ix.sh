{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
bin/neo/vim/unwrap/nlua0
{% endblock %}

{% block export_libs %}
libnlua0.a
{% endblock %}

{% block export_lib %}
nlua0
{% endblock %}
