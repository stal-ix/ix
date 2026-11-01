{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/mariadb/12/unwrap(libfmt_ver=9)
{% endblock %}
