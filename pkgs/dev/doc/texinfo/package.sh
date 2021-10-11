{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/texinfo/texinfo-6.8.tar.xz
# md5 a91b404e30561a5df803e6eb3a53be71
{% endblock %}

{% block deps %}
# bld dev/build/make dev/lang/perl5 env/std
{% endblock %}
