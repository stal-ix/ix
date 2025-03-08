{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/rust/linux/{{rustc_ver}}
bld/musl
{% endblock %}
