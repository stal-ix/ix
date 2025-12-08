{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if conf_ver %}
bin/auto/conf/{{conf_ver}}
{% elif native %}
bin/auto/conf/2/69(std_box=bld/boot/box)
{% else %}
bin/auto/conf/2/69
{% endif %}
{% endblock %}
