{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/p-gen/smenu/archive/refs/tags/v1.3.0.tar.gz
sha:f69480f98e0bb42f3465a303a109c968ad29e6757a6fb94595ded61b4896ad3e
{% endblock %}

{% block conf_ver %}2/71{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}
