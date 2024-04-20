{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/syslog-ng/syslog-ng/releases/download/syslog-ng-4.7.1/syslog-ng-4.7.1.tar.gz
sha:5477189a2d12325aa4faebfcf59f5bdd9084234732f0c3ec16dd253847dacf1c
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
