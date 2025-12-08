{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if native %}
bld/auto(conf_ver=2/71,std_box=bld/boot/box)
{% else %}
bld/auto(conf_ver=2/71)
{% endif %}
{% endblock %}
