{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/syslog-ng/syslog-ng/releases/download/syslog-ng-4.6.0/syslog-ng-4.6.0.tar.gz
sha:b69e3360dfb96a754a4e1cbead4daef37128b1152a23572356db4ab64a475d4f
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
lib/glib
lib/pcre
lib/curl
lib/json/c
lib/hiredis
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/tar
bld/flex
bld/bison
bld/python
bld/auto/archive
{% endblock %}

{% block autoreconf %}
(
cd lib/ivykis
libtoolize -ci
autoreconf -if
)
{{super()}}
{% endblock %}

{% block setup_target_flags %}
export CXXFLAGS="-std=c++20 ${CXXFLAGS}"
{% endblock %}

{% block patch %}
>modules/examples/sources/random-choice-generator/random-choice-generator.cpp
{% endblock %}
