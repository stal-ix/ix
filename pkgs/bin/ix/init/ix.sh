{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/ix/init/rc
bin/ix/init/pid1
bin/ix/init/halt
bin/runit/sys/etc
bin/ix/init/reboot
bin/ix/init/poweroff
bin/ix/init/ewontfix
{% endblock %}
