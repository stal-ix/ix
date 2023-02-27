{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if mesa_driver == 'radv' %}
bin/epiphany/unwrap(mesa_driver=radeonsi,mesa_driver_override=radeonsi,gtk_ver=4)
{% else %}
bin/epiphany/unwrap(gtk_ver=4)
{% endif %}
{% endblock %}
