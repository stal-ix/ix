{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/autoconf/autoconf-2.71.tar.xz
# md5 12cfa1687ffa2606337efe1a64416106
{% endblock %}

{% block deps %}
# lib dev/lang/m4
# bld dev/lang/perl5 dev/build/make env/std
{% endblock %}
