{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if native %}
bin/ninja(std_box=bld/boot/box)
{% else %}
bin/ninja
{% endif %}
{% endblock %}
