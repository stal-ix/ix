{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/build/opt/gc
lib/build/opt/O2
lib/build/opt/LTO
lib/build/opt/ICF
lib/build/opt/sections
{% endblock %}
