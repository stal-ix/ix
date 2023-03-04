{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/modplug-xmms/libmodplug-0.8.9.0.tar.gz
sha:457ca5a6c179656d66c01505c0d95fafaead4329b9dbaa0f997d00a3508ad9de
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block setup %}
export CXXFLAGS="-Wno-register ${CXXFLAGS}"
export OPTFLAGS="${OPTFLAGS} -fno-fast-math"
{% endblock %}
