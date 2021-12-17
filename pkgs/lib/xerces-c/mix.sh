{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://archive.apache.org/dist/xerces/c/3/sources/xerces-c-3.2.3.tar.gz
a5fa4d920fce31c9ca3bfef241644494
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
lib/c++/mix.sh
lib/curl/mix.sh
lib/iconv/mix.sh
{% endblock %}

{% block c_rename_symbol %}
stricmp
strnicmp
{% endblock %}

{% block setup %}
export CXXFLAGS="-w ${CXXFLAGS}"
{% endblock %}

{% block cmake_flags %}
-Dnetwork-accessor=curl
-Dtranscoder=iconv
-Dmessage-loader=inmemory
-Dmutex-manager=standard
{% endblock %}
