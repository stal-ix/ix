{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/lsyncd/lsyncd/archive/refs/tags/v2.3.1.tar.gz
sha:501f70368da8c43d3da81bf9bbb22f43dfcbc9f96b03c745842f326723c091c7
{% endblock %}

{% block bld_libs %}
lib/c
lib/lua/{{luaver}}
{% endblock %}

{% block bld_tool %}
lib/lua/{{luaver}}
{% endblock %}

{% block cmake_flags %}
CMAKE_INSTALL_MANDIR=${out}/doc
{% endblock %}
