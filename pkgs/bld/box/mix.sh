{%extends '//mix/hub.sh' %}

{% block run_deps %}
set/box/gnu(std_box=bld/boot/box,intl_ver=no)
{% endblock %}
