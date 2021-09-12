{% extends '//util/autohell.sh' %}

{% block fetch %}
# url http://ftp.gnu.org/gnu/screen/screen-4.8.0.tar.gz
# md5 d276213d3acd10339cd37848b8c4ab1e
{% endblock %}

{% block deps %}
# bld lib/ncurses dev/build/make env/std
{% endblock %}

{% block coflags %}
--enable-colors256
{% endblock %}
