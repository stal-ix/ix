{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/m4
{% if native %}
bin/bison/3/7(std_box=bld/boot/box,intl_ver=no)
{% else %}
bin/bison/3/7(intl_ver=no)
{% endif %}
{% endblock %}
