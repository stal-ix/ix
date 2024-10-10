{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/smuellerDD/jitterentropy-library/archive/refs/tags/v3.6.0.tar.gz
sha:e2af325cdc7d951a66af782fad4bcdd622e9d8355dd024b7562e2f8b3f6079cd
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
