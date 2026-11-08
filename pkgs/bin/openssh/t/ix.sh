{% extends '//die/c/autorehell.sh' %}

{% block version %}
10.6p2
{% endblock %}

{% block xver %}
{{self.version().strip()[:-2].replace('.', '_')}}_{{self.version().strip()[-2:].upper()}}
{% endblock %}

{% block pkg_name %}
openssh
{% endblock %}

{% block fetch %}
https://github.com/openssh/openssh-portable/archive/refs/tags/V_{{self.xver().strip()}}.tar.gz
c93873149687f9c80226dced4a4588ad7d0ad1bcd0b3220b0bb155ac836e8719
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
