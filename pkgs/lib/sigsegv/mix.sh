{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/libsigsegv/libsigsegv-2.13.tar.gz
cf4a5fdc95e5494eaa190825af11f3be
{% endblock %}

{% block std_env %}
env/std/0/mix.sh
{% endblock %}
