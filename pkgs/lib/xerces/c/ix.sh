{% extends '//die/cmake.sh' %}

{% block fetch %}
https://archive.apache.org/dist/xerces/c/3/sources/xerces-c-3.2.3.tar.gz
md5:a5fa4d920fce31c9ca3bfef241644494
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
