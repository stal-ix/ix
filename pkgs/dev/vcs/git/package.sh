{% extends '//mix/template/make.sh' %}

{% block fetch %}
# url https://github.com/git/git/archive/refs/tags/v2.32.0-rc1.tar.gz
# md5 5977037fe36445a5b57872cb48335004
{% endblock %}

{% block deps %}
# bld lib/z/package.sh
# bld lib/curl/package.sh
# bld lib/iconv/package.sh
# bld lib/expat/package.sh
# bld lib/pcre2/package.sh
# bld lib/openssl/package.sh
# bld dev/build/make/package.sh
# bld dev/lang/perl5/package.sh
# bld dev/lang/python/3/minimal/package.sh
# bld gnu/gettext/package.sh
# bld env/std/package.sh
# run shell/openssh/package.sh
{% endblock %}

{% block toolconf %}
ln -s $(command -v bsdtar) tar
ln -s $(command -v bsdcpio) cpio
{% endblock %}

{% block make_flags %}
INSTALL_SYMLINKS=yes
NO_REGEX=NeedsStartEnd
{% endblock %}
