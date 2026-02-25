{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
libpcap
{% endblock %}

{% block version %}
1.10.6
{% endblock %}

{% block fetch %}
https://www.tcpdump.org/release/libpcap-{{self.version().strip()}}.tar.gz
872dd11337fe1ab02ad9d4fee047c9da244d695c6ddf34e2ebb733efd4ed8aa9
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

{% block env %}
export COFLAGS="--with-libpcap=${out} \${COFLAGS}"
{% endblock %}
