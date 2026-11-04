{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/rust/97/{{target.os}}
{% if linux %}
bld/musl
{% endif %}
{% endblock %}
