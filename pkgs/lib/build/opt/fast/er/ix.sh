{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/build/opt/gc
lib/build/opt/O3
lib/build/opt/ICF
lib/build/opt/LTO/FAT
lib/build/opt/sections
{% endblock %}
