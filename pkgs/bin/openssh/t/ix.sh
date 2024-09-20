{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/openssh/openssh-portable/archive/refs/tags/V_9_9_P1.tar.gz
sha:e8858153f188754d0bbf109477690eba226132879b6840cf08b51afb38151040
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
