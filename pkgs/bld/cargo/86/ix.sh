{% extends '//die/hub.sh' %}

{% block run_deps %}
#bld/cargo/86/unwrap
bld/rust(rustc_ver=86)
{% endblock %}
