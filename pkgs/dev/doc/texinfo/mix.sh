{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/texinfo/texinfo-6.8.tar.xz
a91b404e30561a5df803e6eb3a53be71
{% endblock %}

{% block bld_deps %}
dev/lang/perl5/mix.sh
env/autohell/mix.sh
{% endblock %}
