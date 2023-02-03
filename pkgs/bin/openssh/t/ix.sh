{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-9.2p1.tar.gz
sha:3f66dbf1655fb45f50e1c56da62ab01218c228807b21338d634ebcdf9d71cf46
https://raw.githubusercontent.com/Homebrew/patches/1860b0a745f1fe726900974845d1b0dd3c3398d6/openssh/patch-sandbox-darwin.c-apple-sandbox-named-external.diff
sha:d886b98f99fd27e3157b02b5b57f3fb49f43fd33806195970d4567f12be66e71
https://raw.githubusercontent.com/Homebrew/patches/d8b2d8c2612fd251ac6de17bf0cc5174c3aab94c/openssh/patch-sshd.c-apple-sandbox-named-external.diff
sha:3505c58bf1e584c8af92d916fe5f3f1899a6b15cc64a00ddece1dc0874b2f78f
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

{% block patch %}
cat ${src}/*.diff | patch -p1
{% endblock %}

{% block configure_flags %}
--disable-strip
# -fzero-call-used-regs broken with clang15
--without-hardening
--without-stackprotect
--with-privsep-path=${out}/lib
{% endblock %}
