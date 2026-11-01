{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/mariadb/13/unwrap(libfmt_ver=9)
{% endblock %}
