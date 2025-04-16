{% extends '//die/c/make.sh' %}

{% block pkg_name %}
jitterentropy-library
{% endblock %}

{% block version %}
3.6.1
{% endblock %}

{% block fetch %}
https://github.com/smuellerDD/jitterentropy-library/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:783e71bf5c805a68510511e0da177560123a71c86f0efc5a6a21cf5d9cea3ea9
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block setup_target_flags %}
export OPTFLAGS="${OPTFLAGS} -O0"
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block bld_tool %}
bin/gzip
{% endblock %}

{% block env %}
export CPPFLAGS="-DJENT_CONF_ENABLE_INTERNAL_TIMER=1 \${CPPFLAGS}"
{% endblock %}
