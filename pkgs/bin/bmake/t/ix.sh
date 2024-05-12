{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20240508.tar.gz
sha:847a20f03e6f2ee26b9f7cf8db4a353120540686daa565e2ec6ff800317ddaab
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
