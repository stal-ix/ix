{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libipt
{% endblock %}

{% block version %}
2.1.2
{% endblock %}

{% block fetch %}
https://github.com/intel/libipt/archive/refs/tags/v{{self.version().strip()}}.tar.gz
713d3e76b6c3073b122a9f5b6c025bc301a0436582f132caf782814363acf60f
{% endblock %}

{% block env %}
export COFLAGS="--with-libipt-prefix=${out} \${COFLAGS}"
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
