{% extends '//die/fonts.sh' %}

{% block pkg_name %}
IBM-plex
{% endblock %}

{% block version %}
6.4.0
{% endblock %}

{% block fetch %}
https://github.com/IBM/plex/releases/download/v{{self.version().strip()}}/OpenType.zip
sha:e8e502823a9c6c7dda9ebb1710c5f6c4001db4ab15067d9ec373a6d39844fc1d
{% endblock %}
