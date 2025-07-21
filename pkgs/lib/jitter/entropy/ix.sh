{% extends '//die/c/make.sh' %}

{% block pkg_name %}
jitterentropy-library
{% endblock %}

{% block version %}
3.6.3
{% endblock %}

{% block fetch %}
https://github.com/smuellerDD/jitterentropy-library/archive/refs/tags/v{{self.version().strip()}}.tar.gz
9b3819e275e6473a94c70cfaae7cc2a87a11f60b862e694745daa5d232b0eea3
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block setup_target_flags %}
export CFLAGS="${CFLAGS} -O0"
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
