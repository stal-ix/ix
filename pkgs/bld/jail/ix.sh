{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/mount
bin/setcwd
bld/jail/helpers
bld/jail/scripts
{% endblock %}
