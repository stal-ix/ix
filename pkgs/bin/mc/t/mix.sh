{% extends '//mix/autorehell.sh' %}

{% block fetch %}
http://ftp.midnight-commander.org/mc-4.8.28.tar.xz
sha:e994d9be9a7172e9ac4a4ad62107921f6aa312e668b056dfe5b8bcebbaf53803
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
bld/gettext
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
