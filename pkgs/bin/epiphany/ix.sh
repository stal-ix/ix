{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if mesa_driver == 'radv' %}
bin/epiphany/unwrap(mesa_driver=radeonsi)
{% else %}
bin/epiphany/unwrap
{% endif %}
{% endblock %}
