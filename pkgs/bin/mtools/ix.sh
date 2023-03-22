{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
http://ftp.gnu.org/gnu/mtools/mtools-4.0.43.tar.lz
sha:997ffe4125a19de1fd433ed63f128f7d54bc1a5915f3cdb36da6491ef917f217
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}
