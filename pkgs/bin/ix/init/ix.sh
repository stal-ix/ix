{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/ix/init/rc
bin/runit/sys/etc
bin/ix/runsvdir/cpp
bin/ix/init/ewontfix
{% endblock %}
