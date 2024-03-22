{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if server %}
bin/autologin(slot=1)
{% else %}
bin/{{getty}}/runit(vt_slot=1)
bin/{{getty}}/runit(vt_slot=2)
bin/{{getty}}/runit(vt_slot=3)
bin/{{getty}}/runit(vt_slot=4)
{% if failsafe %}
bin/autologin(slot=5)
{% else %}
bin/{{getty}}/runit(vt_slot=5)
{% endif %}
{% endif %}
{% endblock %}
