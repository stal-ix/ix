{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
http://ftp.gnome.org/pub/gnome/sources/intltool/0.35/intltool-0.35.5.tar.bz2
f52d5fa7f128db94e884cd21dd45d2e2
{% endblock %}

{% block bld_tool %}
dev/tool/perl/full/mix.sh
dev/build/auto/conf/2/69/mix.sh
dev/build/auto/make/1.16.3/mix.sh
{% endblock %}

{% block run_deps %}
dev/tool/perl/full/mix.sh
{% endblock %}
