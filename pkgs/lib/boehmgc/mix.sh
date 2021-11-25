{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/ivmai/bdwgc/archive/refs/tags/v8.0.6.tar.gz
50c490f2a55f5e747f7cb9f18acb7c68
{% endblock %}

{% block lib_deps %}
lib/atomicops/mix.sh
{{'lib/darwin/framework/CoreFoundation/mix.sh' | darwin}}
{% endblock %}

{% block bld_tool %}
dev/build/autoconf/2/69/mix.sh
dev/build/automake/1.16.3/mix.sh
{% endblock %}

{% block autoreconf %}
dash autogen.sh
{% endblock %}

{% block coflags %}
--disable-debug
--disable-cplusplus
--enable-large-config
{% endblock %}

{% block env %}
export COFLAGS="--with-libgc-prefix=${out} \${COFLAGS}"
{% endblock %}

{% block test %}
make check
{% endblock %}
