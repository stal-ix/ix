{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/syslog-ng/syslog-ng/releases/download/syslog-ng-4.3.1/syslog-ng-4.3.1.tar.gz
sha:999dbab62982c3cffba02c0be22c596ee1ce81d6954689dc9b3a6afeb513cce3
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
