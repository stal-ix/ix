{% extends '//mix/template/make.sh' %}

{% block fetch %}
# url https://github.com/git/git/archive/refs/tags/v2.32.0-rc1.tar.gz
# md5 5977037fe36445a5b57872cb48335004
{% endblock %}

{% block deps %}
# bld lib/z lib/curl lib/iconv lib/expat lib/pcre2 lib/openssl
# bld dev/build/make dev/lang/perl5 dev/lang/python/3/minimal tool/text/gnu/gettext env/std
# run shell/openssh
{% endblock %}

{% block toolconf %}
ln -s $(which bsdtar) tar
ln -s $(which bsdcpio) cpio
{% endblock %}

{% block make_flags %}
INSTALL_SYMLINKS=yes
NO_REGEX=NeedsStartEnd
{% endblock %}
