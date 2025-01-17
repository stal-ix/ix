{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/rtorrent/unwrap(libcplpl_ver=18)
{% endblock %}
