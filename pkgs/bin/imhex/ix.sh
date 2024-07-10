{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/imhex/unwrap(libcplpl_ver=17)
org/freedesktop/portal/desktop
{% endblock %}
