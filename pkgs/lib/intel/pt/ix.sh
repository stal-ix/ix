{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libipt
{% endblock %}

{% block version %}
2.2
{% endblock %}

{% block fetch %}
https://github.com/intel/libipt/archive/refs/tags/v{{self.version().strip()}}.tar.gz
f09a18fefba81d4fc2530d90858789e0c596f1b634e5777e6ccaf492966e9845
{% endblock %}

{% block env %}
export COFLAGS="--with-libipt-prefix=${out} \${COFLAGS}"
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
