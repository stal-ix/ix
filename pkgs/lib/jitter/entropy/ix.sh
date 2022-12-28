{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/smuellerDD/jitterentropy-library/archive/refs/tags/v3.4.1.tar.gz
sha:33352369092b5a0d1463c720f5a8a3e870dbd63502ea57692e7da84a65c0c5c3
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block setup %}
export OPTFLAGS="${OPTFLAGS} -O0"
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block bld_tool %}
bin/gzip
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
cp libjitterentropy.so.3.4.1 libjitterentropy.a
{% endblock %}

{% block env %}
export CPPFLAGS="-DJENT_CONF_ENABLE_INTERNAL_TIMER=1 \${CPPFLAGS}"
{% endblock %}
