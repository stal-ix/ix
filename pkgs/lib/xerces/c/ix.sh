{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://archive.apache.org/dist/xerces/c/3/sources/xerces-c-3.2.4.tar.gz
sha:3d8ec1c7f94e38fee0e4ca5ad1e1d9db23cbf3a10bba626f6b4afa2dedafe5ab
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/curl
lib/iconv
{% endblock %}

{% block c_rename_symbol %}
stricmp
strnicmp
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block cmake_flags %}
network-accessor=curl
transcoder=iconv
message-loader=inmemory
mutex-manager=standard
{% endblock %}
