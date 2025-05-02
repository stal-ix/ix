{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if boot %}
lib/build/opt/O2
{% elif linux %}
lib/build/opt/O2
lib/build/opt/gc
lib/build/opt/ICF
lib/build/opt/safe
lib/build/noexec
{% else %}
lib/build/opt/O2
lib/build/opt/safe
{% endif %}
{% endblock %}
