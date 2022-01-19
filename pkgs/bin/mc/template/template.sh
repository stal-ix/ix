{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
http://ftp.midnight-commander.org/mc-4.8.27.tar.xz
e51cd40a897d9aa01af251d191637ca4
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/glib
lib/iconv
lib/{{self.typ().strip()}}
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}

{% block run_deps %}
set/compress
{% endblock %}

{% block c_rename_symbol %}
update_panels
tilde_expand
{% endblock %}

{% block setup %}
export CPPFLAGS="-w ${CPPFLAGS}"
{% endblock %}

{% block configure_flags %}
--with-screen={{self.typ().strip()}}
--with-search-engine=glib
{% endblock %}
