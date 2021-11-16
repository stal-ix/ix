{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/texinfo/texinfo-6.8.tar.xz
a91b404e30561a5df803e6eb3a53be71
{% endblock %}

{% block bld_libs %}
lib/curses/mix.sh
{% endblock %}

{% block bld_tool %}
dev/lang/perl5/mix.sh
{% endblock %}

{% block std_env %}
env/std/0/mix.sh
{% endblock %}
