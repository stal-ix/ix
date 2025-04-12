{% extends '//die/c/waf.sh' %}

{% block version %}
1.9.19
{% endblock %}

{% block fetch %}
https://github.com/jackaudio/jack2/archive/v{{self.version().strip()}}.tar.gz
sha:9030f4dc11773351b6ac96affd9c89803a5587ebc1b091e5ff866f433327e4b0
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/bash
{{super()}}
{% endblock %}

{% block cxx_flags %}
{{super()}}
-Wno-register
{% endblock %}

{% block waf_flags %}
--classic
--systemd=no
{% endblock %}

{% block patch %}
sed -e 's|.*opt.*xcode6.*||' -i wscript

find . -name '*.sh' | while read l; do
    sed -e 's|/bin/bash|/usr/bin/env bash|' -i ${l}
done
{{super()}}
{% endblock %}
