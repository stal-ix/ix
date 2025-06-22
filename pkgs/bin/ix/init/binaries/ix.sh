{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/ix/init/ewontfix
bin/ix/init/reboot(prog_name=reboot,prog_action=RB_AUTOBOOT)
bin/ix/init/reboot(prog_name=halt,prog_action=RB_HALT_SYSTEM)
bin/ix/init/reboot(prog_name=poweroff,prog_action=RB_POWER_OFF)
{% endblock %}
