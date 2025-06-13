{% extends '//die/c/waf.sh' %}

{% block pkg_name %}
jack2
{% endblock %}

{% block version %}
1.9.22
{% endblock %}

{% block fetch %}
https://github.com/jackaudio/jack2/archive/v{{self.version().strip()}}.tar.gz
1e42b9fc4ad7db7befd414d45ab2f8a159c0b30fcd6eee452be662298766a849
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
