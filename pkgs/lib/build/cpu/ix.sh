{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if armv7 %}
lib/build/cpu/armv7
{% endif %}
{% if simd128 and wasi %}
lib/build/cpu/simd128
{% endif %}
{% endblock %}
