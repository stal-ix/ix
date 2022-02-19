{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/clang/14/gcc(std_env=boot/7/env/cxx,zlib_ver=adler)
{% endblock %}
