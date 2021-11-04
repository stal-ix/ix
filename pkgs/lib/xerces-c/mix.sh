{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://archive.apache.org/dist/xerces/c/3/sources/xerces-c-3.2.3.tar.gz
a5fa4d920fce31c9ca3bfef241644494
{% endblock %}

{% block lib_deps %}
lib/cxx/mix.sh
lib/curl/mix.sh
lib/iconv/mix.sh
{% endblock %}

{% block bld_deps %}
dev/build/cmake/mix.sh
env/std/mix.sh
{% endblock %}

{% block cflags %}
export CPPFLAGS="-Dstricmp=xerces_stricmp -Dstrnicmp=xerces_strnicmp ${CPPFLAGS}"
export CXXFLAGS="-w ${CXXFLAGS}"
{% endblock %}

{% block cmflags %}
-Dnetwork-accessor=curl
-Dtranscoder=iconv
-Dmessage-loader=inmemory
-Dmutex-manager=standard
{% endblock %}

{% block env %}
export CMFLAGS="-DXERCESC_INCLUDE_DIR=${out}/include \${CMFLAGS}"
{% endblock %}
