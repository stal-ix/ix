{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url http://ftp.midnight-commander.org/mc-4.8.27.tar.xz
# md5 e51cd40a897d9aa01af251d191637ca4
{% endblock %}

{% block deps %}
# bld lib/intl/package.sh
# bld lib/glib/package.sh
# bld lib/iconv/package.sh
# bld lib/{{self.typ().strip()}}/package.sh
# bld dev/build/make/package.sh
# bld dev/build/pkg-config/package.sh
# bld dev/lang/perl5/package.sh
# bld env/std/package.sh
# run tool/compress/bsdtar/package.sh
# run tool/compress/bzip2/package.sh
# run tool/compress/gzip/package.sh
# run tool/compress/p7zip/package.sh
# run tool/compress/unrar/package.sh
# run tool/compress/unzip/package.sh
# run tool/compress/xz/package.sh
# run tool/compress/zip/package.sh
{% endblock %}

{% block cflags %}
export CPPFLAGS="-Dupdate_panels=update_panels_mc -Dtilde_expand=tilde_expand_mc ${CPPFLAGS}"
{% endblock %}

{% block coflags %}
--with-screen={{self.typ().strip()}}
--with-search-engine=glib
{% endblock %}
