{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/compiler_rt/sanitize/address/{{asan_ver or clang_ver or default_clang}}
{% endblock %}
