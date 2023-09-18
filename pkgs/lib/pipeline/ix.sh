{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
http://distfiles.gentoo.org/distfiles/3b/libpipeline-1.5.7.tar.gz
sha:b8b45194989022a79ec1317f64a2a75b1551b2a55bea06f67704cb2a2e4690b0
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
