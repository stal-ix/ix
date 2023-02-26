{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/epiphany/unwrap({% if mesa_driver == 'radv' %}mesa_driver=radeonsi,{% endif %}gtk_ver=4)
{% endblock %}
