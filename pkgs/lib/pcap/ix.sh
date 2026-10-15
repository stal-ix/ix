{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
libpcap
{% endblock %}

{% block version %}
1.11.0
{% endblock %}

{% block fetch %}
https://www.tcpdump.org/release/libpcap-{{self.version().strip()}}.tar.gz
596389bc8560ea027dff9db8aaf6c173d992366d9aef4baf5d7c6d180b4d49ad
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
