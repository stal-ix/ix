{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if native %}
bin/auto/conf/archive(std_box=bld/boot/box)
{% else %}
bin/auto/conf/archive
{% endif %}
{% endblock %}
