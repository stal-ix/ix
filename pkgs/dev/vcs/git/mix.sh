{% extends '//mix/template/make.sh' %}

{% block fetch %}
# url https://github.com/git/git/archive/refs/tags/v2.32.0-rc1.tar.gz
# md5 5977037fe36445a5b57872cb48335004
{% endblock %}

{% block deps %}
# bld lib/z/mix.sh
# bld lib/curl/mix.sh
# bld lib/iconv/mix.sh
# bld lib/expat/mix.sh
# bld lib/pcre2/mix.sh
# bld lib/openssl/mix.sh
# bld dev/build/make/mix.sh
# bld dev/lang/perl5/mix.sh
# bld dev/lang/python/3/minimal/mix.sh
# bld gnu/gettext/mix.sh
# bld env/std/mix.sh
# run shell/openssh/mix.sh
{% endblock %}

{% block toolconf %}
ln -s $(command -v bsdtar) tar
ln -s $(command -v bsdcpio) cpio
{% endblock %}

{% block make_flags %}
INSTALL_SYMLINKS=yes
NO_REGEX=NeedsStartEnd
{% endblock %}
