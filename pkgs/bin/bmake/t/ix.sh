{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20230414.tar.gz
sha:29cb1d26aae7de9def92bdaeb3aad4520e89951ce97b2e75f0b89bae1b95399f
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
