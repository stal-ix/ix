{% extends '//mix/autorehell.sh' %}

{% block fetch %}
#http://ftp.gnome.org/pub/gnome/sources/intltool/0.35/intltool-0.35.5.tar.bz2
#f52d5fa7f128db94e884cd21dd45d2e2
https://launchpad.net/intltool/trunk/0.51.0/+download/intltool-0.51.0.tar.gz
sha:67c74d94196b153b774ab9f89b2fa6c6ba79352407037c8c14d5aeb334e959cd
{% endblock %}

{% block bld_tool %}
bld/perl/full
{% endblock %}

{% block run_deps %}
bld/perl/full
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
