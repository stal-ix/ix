{% extends '//die/c/autorehell.sh' %}

{% block version %}
10_0_P2
{% endblock %}

{% block pkg_name %}
openssh
{% endblock %}

{% block fetch %}
https://github.com/openssh/openssh-portable/archive/refs/tags/V_{{self.version().strip()}}.tar.gz
sha:a25b32645dc6b474064b9deb07afc9d8e37b127d026a1170b54feb929145140c
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/edit
lib/ldns
lib/openssl
lib/bsd/overlay
lib/shim/fake(lib_name=curses)
{% endblock %}

{% block bld_tool %}
bin/groff
bld/texinfo
{% endblock %}

{% block cpp_defines %}
__APPLE_SANDBOX_NAMED_EXTERNAL__
{% endblock %}

{% block configure_flags %}
--disable-strip
# -fzero-call-used-regs broken with clang15
--without-hardening
--without-stackprotect
--with-privsep-path=${out}/lib
{% endblock %}
