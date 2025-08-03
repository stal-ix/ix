{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/ix/init/rc
bin/ix/init/pid1
bin/runit/sys/etc
bin/ix/init/binaries(bumpalloc_buf=10000)
bin/ix/init/reboot(prog_name=reboot,prog_action=19088743)
bin/ix/init/reboot(prog_name=halt,prog_action=3454992675)
bin/ix/init/reboot(prog_name=poweroff,prog_action=1126301404)
{% endblock %}
