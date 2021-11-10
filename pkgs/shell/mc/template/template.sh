{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
http://ftp.midnight-commander.org/mc-4.8.27.tar.xz
e51cd40a897d9aa01af251d191637ca4
{% endblock %}

{% block bld_deps %}
lib/intl/mix.sh
lib/glib/mix.sh
lib/iconv/mix.sh
lib/{{self.typ().strip()}}/mix.sh
dev/lang/perl5/mix.sh
{{super()}}
{% endblock %}

{% block run_deps %}
tool/compress/bsdtar/mix.sh
tool/compress/bzip2/mix.sh
tool/compress/gzip/mix.sh
tool/compress/p7zip/mix.sh
tool/compress/unrar/mix.sh
tool/compress/unzip/mix.sh
tool/compress/xz/mix.sh
tool/compress/zip/mix.sh
{% block mc_run_deps %}
{% endblock %}
{% endblock %}

{% block setup %}
export CPPFLAGS="-w -Dupdate_panels=update_panels_mc -Dtilde_expand=tilde_expand_mc ${CPPFLAGS}"
{% endblock %}

{% block coflags %}
--with-screen={{self.typ().strip()}}
--with-search-engine=glib
{% endblock %}
