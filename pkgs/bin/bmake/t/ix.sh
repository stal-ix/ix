{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20220724.tar.gz
sha:aefabbc723fb20a583b39f6518256dd8deb23108322c25bc38284175888b257a
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
