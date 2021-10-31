{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url http://ftp.midnight-commander.org/mc-4.8.27.tar.xz
# md5 e51cd40a897d9aa01af251d191637ca4
{% endblock %}

{% block deps %}
# bld lib/intl/mix.sh
# bld lib/glib/mix.sh
# bld lib/iconv/mix.sh
# bld lib/{{self.typ().strip()}}/mix.sh
# bld dev/build/make/mix.sh
# bld dev/build/pkg-config/mix.sh
# bld dev/lang/perl5/mix.sh
# bld env/std/mix.sh
# run tool/compress/bsdtar/mix.sh
# run tool/compress/bzip2/mix.sh
# run tool/compress/gzip/mix.sh
# run tool/compress/p7zip/mix.sh
# run tool/compress/unrar/mix.sh
# run tool/compress/unzip/mix.sh
# run tool/compress/xz/mix.sh
# run tool/compress/zip/mix.sh
{% endblock %}

{% block cflags %}
export CPPFLAGS="-Dupdate_panels=update_panels_mc -Dtilde_expand=tilde_expand_mc ${CPPFLAGS}"
{% endblock %}

{% block coflags %}
--with-screen={{self.typ().strip()}}
--with-search-engine=glib
{% endblock %}
