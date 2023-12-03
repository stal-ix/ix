{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/binutils
bld/fake/gcc
bld/windres/unwrap/env
{% endblock %}
