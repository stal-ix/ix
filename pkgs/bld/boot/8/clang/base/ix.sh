{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/clang/14/gcc(std_env=bld/boot/7/env/cxx,zlib_ver=adler)
{% endblock %}
