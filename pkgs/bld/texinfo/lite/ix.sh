{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if all_system %}
bld/texinfo/lite/unwrap
{% elif system_texinfo %}
bld/system
{% elif native %}
bld/texinfo/lite/unwrap(std_box=bld/boot/box)
{% else %}
bld/texinfo/lite/unwrap
{% endif %}
{% endblock %}
