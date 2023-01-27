{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20230123.tar.gz
sha:6557c48d144a6b531fa26c7273c090c656280ba7b43df376971a5b2cdbe01b2f
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
