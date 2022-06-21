{% extends '//die/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/libidn/libidn-1.40.tar.gz
sha:527f673b8043d7189c056dd478b07af82492ecf118aa3e0ef0dc98c11af79991
{% endblock %}

{% block lib_deps %}
lib/c
lib/iconv
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-libidn=${out} \${COFLAGS}"
{% endblock %}
