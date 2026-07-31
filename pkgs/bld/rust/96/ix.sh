{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/rust/96/{{target.os}}
{% if linux %}
bld/musl
{% endif %}
{% endblock %}
