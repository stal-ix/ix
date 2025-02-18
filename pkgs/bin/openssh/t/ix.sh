{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/openssh/openssh-portable/archive/refs/tags/V_9_9_P2.tar.gz
sha:082dffcf651b9db762ddbe56ca25cc75a0355a7bea41960b47f3c139974c5e3e
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
