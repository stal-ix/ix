{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
mtools
{% endblock %}

{% block version %}
4.0.48
{% endblock %}

{% block fetch %}
http://ftp.gnu.org/gnu/mtools/mtools-{{self.version().strip()}}.tar.lz
sha:7d57f14a2482dc4658e4b386180793ef50f0de89ee3a9a28f0a371630baac7c4
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}
