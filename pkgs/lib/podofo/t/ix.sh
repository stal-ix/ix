{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/podofo/podofo/0.9.8/podofo-0.9.8.tar.gz
sha:5de607e15f192b8ad90738300759d88dea0f5ccdce3bf00048a0c932bc645154
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/idn
lib/c++
lib/png
lib/tiff
lib/jpeg
lib/openssl
lib/freetype
lib/unistring
lib/fontconfig
{% endblock %}
