{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/capnc/unwrap(libcplpl_ver=18)
{% endblock %}
