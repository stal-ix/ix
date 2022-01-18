{% extends '//mix/template/kconfig.sh' %}

{% block fetch %}
https://github.com/landley/toybox/archive/refs/tags/0.8.5.tar.gz
04f2c748df18e46e100f697193925d1b
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
{% endblock %}

{% block setup %}
export NOSTRIP=yes
{% endblock %}

{% block make_install_target %}
install_flat
{% endblock %}
