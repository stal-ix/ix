{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if native %}
bin/byacc/yacc(std_box=bld/boot/box,intl_ver=no)
{% else %}
bin/byacc/yacc(intl_ver=no)
{% endif %}
{% endblock %}
