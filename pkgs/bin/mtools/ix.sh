{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
http://ftp.gnu.org/gnu/mtools/mtools-4.0.42.tar.lz
sha:40a98fd9bcc865997866015013c3c64a304d98c2892fe4ab892ffd6ac3dd9bae
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}
