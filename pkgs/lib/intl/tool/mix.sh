{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
http://ftp.gnome.org/pub/gnome/sources/intltool/0.35/intltool-0.35.5.tar.bz2
f52d5fa7f128db94e884cd21dd45d2e2
{% endblock %}

{% block bld_tool %}
dev/lang/perl5/full/mix.sh
dev/build/autoconf/2/69/mix.sh
dev/build/automake/1.16.3/mix.sh
{% endblock %}

{% block run_deps %}
dev/lang/perl5/full/mix.sh
{% endblock %}
