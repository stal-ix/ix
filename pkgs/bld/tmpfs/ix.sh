{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/mount
bld/tmpfs/scripts
{% endblock %}
