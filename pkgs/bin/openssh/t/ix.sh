{% extends '//die/c/autorehell.sh' %}

{% block version %}
10.2p1
{% endblock %}

{% block xver %}
{{self.version().strip()[:-2].replace('.', '_')}}_{{self.version().strip()[-2:].upper()}}
{% endblock %}

{% block pkg_name %}
openssh
{% endblock %}

{% block fetch %}
https://github.com/openssh/openssh-portable/archive/refs/tags/V_{{self.xver().strip()}}.tar.gz
8d3083bca4864cbc760bfcc3e67d86d401e27faa5eaafa1482c2316f5d5186b3
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
