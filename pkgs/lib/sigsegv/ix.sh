{% extends '//die/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/libsigsegv/libsigsegv-2.13.tar.gz
md5:cf4a5fdc95e5494eaa190825af11f3be
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
