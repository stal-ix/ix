{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/doxygen/unwrap(libfmt_ver=11)
{% endblock %}
