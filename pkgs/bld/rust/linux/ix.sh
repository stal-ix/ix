{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/musl
bld/rust/linux/unwrap
{% endblock %}
