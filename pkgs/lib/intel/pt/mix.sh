{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/intel/libipt/archive/refs/tags/v2.0.4.tar.gz
cf2c97292dc61ea898dd84b460921f79
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-libipt-prefix=${out} \${COFLAGS}"
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
