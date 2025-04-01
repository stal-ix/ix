{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/mount
bin/setcwd
bin/ix/jail
bld/jail/helpers
{% endblock %}
