{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/openssh/openssh-portable/archive/refs/tags/V_10_0_P1.tar.gz
sha:3915c75ef231f82692a9128ed1570f77e113c816002308ad8a2a7c34ce9926c0
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
