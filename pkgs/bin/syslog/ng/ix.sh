{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
syslog-ng
{% endblock %}

{% block version %}
4.8.3
{% endblock %}

{% block fetch %}
https://github.com/syslog-ng/syslog-ng/releases/download/syslog-ng-{{self.version().strip()}}/syslog-ng-{{self.version().strip()}}.tar.gz
f82732a8e639373037d2b69c0e6d5d6594290f0350350f7a146af4cd8ab9e2c7
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

{% block cxx_flags %}
-std=c++20
{% endblock %}

{% block patch %}
>modules/examples/sources/random-choice-generator/random-choice-generator.cpp
{% endblock %}
