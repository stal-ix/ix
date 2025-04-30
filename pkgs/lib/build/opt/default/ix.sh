{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if boot %}
lib/build/opt/O2
{% else %}
lib/build/opt/O2
lib/build/opt/gc
lib/build/opt/ICF
lib/build/opt/safe
lib/build/opt/sections
{% if linux %}
lib/build/noexec
{% endif %}
{% endif %}
{% endblock %}
