{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/syslog-ng/syslog-ng/releases/download/syslog-ng-4.4.0/syslog-ng-4.4.0.tar.gz
sha:583b147f3ec17fbc2dbbf31aafb1e3966237d7541313de5b41ea885dc16d932e
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
lib/glib
lib/pcre
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

{% block setup %}
export CXXFLAGS="-std=c++20 ${CXXFLAGS}"
{% endblock %}

{% block patch %}
>modules/examples/sources/random-choice-generator/random-choice-generator.cpp
{% endblock %}
