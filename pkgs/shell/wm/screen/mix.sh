{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url http://ftp.gnu.org/gnu/screen/screen-4.8.0.tar.gz
# md5 d276213d3acd10339cd37848b8c4ab1e
{% endblock %}

{% block bld_deps %}
lib/curses/any/mix.sh
dev/build/make/mix.sh
env/std/mix.sh
{% endblock %}

{% block coflags %}
--enable-colors256
{% endblock %}
