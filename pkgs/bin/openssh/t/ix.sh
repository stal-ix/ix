{% extends '//die/c/autorehell.sh' %}

{% block version %}
10.5p1
{% endblock %}

{% block xver %}
{{self.version().strip()[:-2].replace('.', '_')}}_{{self.version().strip()[-2:].upper()}}
{% endblock %}

{% block pkg_name %}
openssh
{% endblock %}

{% block fetch %}
https://github.com/openssh/openssh-portable/archive/refs/tags/V_{{self.xver().strip()}}.tar.gz
494c0624ed743a4eecc1bdd83d2aab9456bdb4cabc511e00599e71493537e258
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
