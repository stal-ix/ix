{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
http://ftp.gnu.org/gnu/screen/screen-4.8.0.tar.gz
d276213d3acd10339cd37848b8c4ab1e
{% endblock %}

{% block bld_libs %}
lib/curses/mix.sh
{% endblock %}

{% block configure_flags %}
--enable-colors256
{% endblock %}
