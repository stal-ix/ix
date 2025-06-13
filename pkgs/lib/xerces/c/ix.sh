{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
xerces-c
{% endblock %}

{% block version %}
3.3.0
{% endblock %}

{% block fetch %}
https://archive.apache.org/dist/xerces/c/3/sources/xerces-c-{{self.version().strip()}}.tar.gz
9555f1d06f82987fbb4658862705515740414fd34b4db6ad2ed76a2dc08d3bde
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
