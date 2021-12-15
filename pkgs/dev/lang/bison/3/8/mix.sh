{% extends '//dev/lang/bison/3/7/mix.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/bison/bison-3.8.2.tar.lz
26e76218c2a50a0dd307286d42eb0af9
{% endblock %}

{% block bison_bootstrap %}
dev/lang/bison/3/8/0/mix.sh
{% endblock %}

{% block bld_libs %}
lib/c/mix.sh
{% endblock %}
