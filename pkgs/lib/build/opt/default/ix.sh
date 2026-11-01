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
{% if x86_64 %}
lib/build/opt/x86/64/v3
{% endif %}
{% else %}
lib/build/opt/O2
lib/build/opt/safe
{% if x86_64 %}
lib/build/opt/x86/64/v3
{% endif %}
{% endif %}
{% endblock %}
