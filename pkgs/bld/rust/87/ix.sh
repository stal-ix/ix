{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/rust/87/{{target.os}}
{% if linux %}
bld/musl
{% endif %}
{% endblock %}
