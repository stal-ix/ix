{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://archive.apache.org/dist/xerces/c/3/sources/xerces-c-3.2.5.tar.gz
sha:545cfcce6c4e755207bd1f27e319241e50e37c0c27250f11cda116018f1ef0f5
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
