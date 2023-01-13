{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.tcpdump.org/release/libpcap-1.10.3.tar.gz
sha:2a8885c403516cf7b0933ed4b14d6caa30e02052489ebd414dc75ac52e7559e6
{% endblock %}

{% block lib_deps %}
lib/c
lib/nl
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|Libs.private.*||' \
    -e 's|-Wl,-rpath.* ||' \
    -e 's|Requires.private.*||' \
    -i ${out}/lib/pkgconfig/libpcap.pc
{% endblock %}
