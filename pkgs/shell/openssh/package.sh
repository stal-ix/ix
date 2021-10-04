{% extends '//util/autohell.sh' %}

{% block fetch %}
# url https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-8.6p1.tar.gz
# md5 805f7048aec6dd752584e570383a6f00
# url https://raw.githubusercontent.com/Homebrew/patches/1860b0a745f1fe726900974845d1b0dd3c3398d6/openssh/patch-sandbox-darwin.c-apple-sandbox-named-external.diff
# md5 33cc7e83ce4fe6ecadd1283967f795c3
# url https://raw.githubusercontent.com/Homebrew/patches/d8b2d8c2612fd251ac6de17bf0cc5174c3aab94c/openssh/patch-sshd.c-apple-sandbox-named-external.diff
# md5 a50fb1d7c40ac7fac3360218cb37a38b
{% endblock %}

{% block deps %}
# bld lib/z lib/edit lib/ldns lib/openssl
# bld dev/build/make dev/build/pkg-config tool/text/gnu/patch env/std
{% endblock %}

{% block toolconf %}
echo << EOF > strip
#!$(which dash)
EOF

chmod +x strip

ln -s $lib_ncurses/lib/libncurses.a libcurses.a
export LDFLAGS="-L${PWD} ${LDFLAGS}"
{% endblock %}

{% block cflags %}
export CPPFLAGS="-D__APPLE_SANDBOX_NAMED_EXTERNAL__ ${CPPFLAGS}"
{% endblock %}

{% block patch %}
cat ${src}/*.diff | patch -p1
{% endblock %}

{% block coflags %}
--disable-strip
--with-privsep-path=${out}/tmp/privsep
{% endblock %}
