{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/clang/lib(kind=lib)
bin/clang/env/wrapper
{% endblock %}
