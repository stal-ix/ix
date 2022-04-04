{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-8.9p1.tar.gz
sha:fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdaccd262380ae58bec5e7
https://raw.githubusercontent.com/Homebrew/patches/1860b0a745f1fe726900974845d1b0dd3c3398d6/openssh/patch-sandbox-darwin.c-apple-sandbox-named-external.diff
33cc7e83ce4fe6ecadd1283967f795c3
https://raw.githubusercontent.com/Homebrew/patches/d8b2d8c2612fd251ac6de17bf0cc5174c3aab94c/openssh/patch-sshd.c-apple-sandbox-named-external.diff
a50fb1d7c40ac7fac3360218cb37a38b
{% endblock %}

{% block bld_libs %}
bin/openssh/libs(openssl=1,curses=netbsd)
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
--with-privsep-path=${out}/tmp/privsep
{% endblock %}
