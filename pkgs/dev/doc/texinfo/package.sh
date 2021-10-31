{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/texinfo/texinfo-6.8.tar.xz
# md5 a91b404e30561a5df803e6eb3a53be71
{% endblock %}

{% block deps %}
# bld dev/build/make/package.sh
# bld dev/lang/perl5/package.sh
# bld env/std/package.sh
{% endblock %}
