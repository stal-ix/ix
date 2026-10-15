{% extends '//die/c/autorehell.sh' %}

{% block version %}
10.6p1
{% endblock %}

{% block xver %}
{{self.version().strip()[:-2].replace('.', '_')}}_{{self.version().strip()[-2:].upper()}}
{% endblock %}

{% block pkg_name %}
openssh
{% endblock %}

{% block fetch %}
https://github.com/openssh/openssh-portable/archive/refs/tags/V_{{self.xver().strip()}}.tar.gz
462a71d064c3bb313f68933f1cf5037528f314fab1be6e2c5fe29a741f2338ee
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
