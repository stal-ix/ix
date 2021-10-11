{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
# url https://archive.apache.org/dist/xerces/c/3/sources/xerces-c-3.2.3.tar.gz
# md5 a5fa4d920fce31c9ca3bfef241644494
{% endblock %}

{% block deps %}
# lib lib/cxx lib/curl lib/iconv
# bld dev/build/cmake env/std
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
export LDFLAGS="-L${out}/lib -lxerces-c \${LDFLAGS}"
export CMFLAGS="-DXERCESC_INCLUDE_DIR=${out}/include \${CMFLAGS}"
{% endblock %}
