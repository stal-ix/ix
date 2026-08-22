{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if all_system or system_meson %}
bld/system
{% else %}
bld/cmake
bld/python
bin/meson/1/4
bld/pkg/config
{% endif %}
{% endblock %}
