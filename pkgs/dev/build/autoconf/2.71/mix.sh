{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/autoconf/autoconf-2.71.tar.xz
# md5 12cfa1687ffa2606337efe1a64416106
{% endblock %}

{% block lib_deps %}
dev/lang/m4/mix.sh
{% endblock %}

{% block bld_deps %}
dev/lang/perl5/mix.sh
dev/build/make/mix.sh
env/std/mix.sh
{% endblock %}
