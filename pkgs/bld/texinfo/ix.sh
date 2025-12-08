{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if native %}
bld/texinfo/unwrap(std_box=bld/boot/box)
{% else %}
bld/texinfo/unwrap
{% endif %}
{% endblock %}
