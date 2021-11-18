{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
http://ftp.midnight-commander.org/mc-4.8.27.tar.xz
e51cd40a897d9aa01af251d191637ca4
{% endblock %}

{% block bld_libs %}
lib/intl/mix.sh
lib/glib/mix.sh
lib/iconv/mix.sh
lib/{{self.typ().strip()}}/mix.sh
{% endblock %}

{% block bld_tool %}
dev/lang/perl5/mix.sh
{% endblock %}

{% block run_deps %}
tool/compress/all/mix.sh
{% endblock %}

{% block setup %}
export CPPFLAGS="-w -Dupdate_panels=update_panels_mc -Dtilde_expand=tilde_expand_mc ${CPPFLAGS}"
{% endblock %}

{% block coflags %}
--with-screen={{self.typ().strip()}}
--with-search-engine=glib
{% endblock %}
