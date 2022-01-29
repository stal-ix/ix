{% extends '//mix/template/autorehell.sh' %}

{% block fetch %}
http://ftp.gnome.org/pub/gnome/sources/intltool/0.35/intltool-0.35.5.tar.bz2
f52d5fa7f128db94e884cd21dd45d2e2
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
