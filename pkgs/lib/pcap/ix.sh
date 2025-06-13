{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
libpcap
{% endblock %}

{% block version %}
1.10.5
{% endblock %}

{% block fetch %}
https://www.tcpdump.org/release/libpcap-{{self.version().strip()}}.tar.gz
37ced90a19a302a7f32e458224a00c365c117905c2cd35ac544b6880a81488f0
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
