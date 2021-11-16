{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-8.6p1.tar.gz
805f7048aec6dd752584e570383a6f00
https://raw.githubusercontent.com/Homebrew/patches/1860b0a745f1fe726900974845d1b0dd3c3398d6/openssh/patch-sandbox-darwin.c-apple-sandbox-named-external.diff
33cc7e83ce4fe6ecadd1283967f795c3
https://raw.githubusercontent.com/Homebrew/patches/d8b2d8c2612fd251ac6de17bf0cc5174c3aab94c/openssh/patch-sshd.c-apple-sandbox-named-external.diff
a50fb1d7c40ac7fac3360218cb37a38b
{% endblock %}

{% block bld_deps %}
net/openssh/lib_hub/mix.sh(openssl=1,curses=netbsd)
gnu/patch/mix.sh
dev/doc/groff/mix.sh
dev/doc/texinfo/mix.sh
{{super()}}
{% endblock %}

{% block setup %}
export CPPFLAGS="-D__APPLE_SANDBOX_NAMED_EXTERNAL__ ${CPPFLAGS}"
{% endblock %}

{% block patch %}
cat ${src}/*.diff | patch -p1
{% endblock %}

{% block coflags %}
--disable-strip
--with-privsep-path=${out}/tmp/privsep
{% endblock %}
