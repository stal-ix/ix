{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/gcc/12/unwrap(libcplpl_ver=16)
{% endblock %}
