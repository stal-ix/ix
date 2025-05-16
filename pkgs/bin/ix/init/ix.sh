{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/ix/init/rc
bin/ix/init/halt
bin/runit/sys/etc
bin/ix/init/reboot
bin/ix/runsvdir/cpp
bin/ix/init/ewontfix
{% endblock %}
