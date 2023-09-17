{% extends '//die/hub.sh' %}

{% block ind_deps %}
bin/clang/lib
{% endblock %}

{% block run_deps %}
bld/compiler/unwrap
{% endblock %}
