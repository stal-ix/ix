{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
http://ftp.gnu.org/gnu/mtools/mtools-4.0.47.tar.lz
sha:2709cd2f42d65500829b056cb0630edd515d7060b4865bad31277f0da9f9e9d5
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}
