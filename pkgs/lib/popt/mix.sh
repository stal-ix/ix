{% extends '//die/autorehell.sh' %}

{% block fetch %}
http://ftp.rpm.org/popt/releases/popt-1.x/popt-1.18.tar.gz
sha:5159bc03a20b28ce363aa96765f37df99ea4d8850b1ece17d1e6ad5c24fdc5d1
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}
