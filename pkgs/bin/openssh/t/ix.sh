{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/openssh/openssh-portable/archive/refs/tags/V_9_8_P1.tar.gz
sha:d8f6802914e4c344dc74599c29915651554bb318102d71cb4063e1f4a0d8286f
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
