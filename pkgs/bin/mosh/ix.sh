{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/mosh/unwrap(libcplpl_ver=17)
{% endblock %}
