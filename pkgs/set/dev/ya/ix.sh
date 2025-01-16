{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/sh
bin/ya
bld/box
bld/python
bin/ya/tools/clang(ya_c_flags=-Wno-error)
bld/fake/binutils
bld/compiler
{% endblock %}
