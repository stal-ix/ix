{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/setcwd
bin/util/linux
bld/jail/helpers
bld/jail/scripts
{% endblock %}
