{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
#https://www.tcpdump.org/release/libpcap-1.10.1.tar.gz
#sha:ed285f4accaf05344f90975757b3dbfe772ba41d1c401c2648b7fa45b711bdd4
https://www.tcpdump.org/release/libpcap-1.10.2.tar.gz
sha:db6d79d4ad03b8b15fb16c42447d093ad3520c0ec0ae3d331104dcfb1ce77560
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
