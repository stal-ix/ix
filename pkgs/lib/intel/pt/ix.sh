{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libipt
{% endblock %}

{% block version %}
2.0.6
{% endblock %}

{% block fetch %}
https://github.com/intel/libipt/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:631f4ebc81e12c0493288af3cc307b0de5b65f018d3e3839c87014b0d26acd75
{% endblock %}

{% block env %}
export COFLAGS="--with-libipt-prefix=${out} \${COFLAGS}"
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
