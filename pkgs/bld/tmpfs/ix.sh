{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/mount
bld/jail/helpers
bld/tmpfs/scripts
{% endblock %}
