{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if conf_ver %}
bin/auto/conf/{{conf_ver}}
{% else %}
bin/auto/conf/2/69(std_box=bld/boot/box)
{% endif %}
{% endblock %}
