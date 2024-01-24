{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if mingetty %}
bin/mingetty/runit(vt_slot=1)
bin/mingetty/runit(vt_slot=2)
bin/mingetty/runit(vt_slot=3)
bin/mingetty/runit(vt_slot=4)
{% if failsafe %}
bin/autologin(slot=5)
{% else %}
bin/mingetty/runit(vt_slot=5)
{% endif %}
{% else %}
bin/emptty/runit
{% endif %}
{% endblock %}
