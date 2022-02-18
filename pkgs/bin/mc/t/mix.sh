{% extends '//mix/autorehell.sh' %}

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
bin/gettext
{% endblock %}

{% block run_deps %}
set/compress
{% endblock %}

{% block c_rename_symbol %}
tilde_expand
update_panels
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block configure_flags %}
--with-screen={{self.typ().strip()}}
--with-search-engine=glib
{% endblock %}
