{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/clang/13/gcc(std_env=boot/7/env/cxx,cplpl_std=14,zlib_ver=adler)
{% endblock %}
