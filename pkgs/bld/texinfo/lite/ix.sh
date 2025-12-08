{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if native %}
bld/texinfo/lite/unwrap(std_box=bld/boot/box)
{% else %}
bld/texinfo/lite/unwrap
{% endif %}
{% endblock %}
