{% extends '//die/fonts.sh' %}

{% block pkg_name %}
IBM-plex
{% endblock %}

{% block version %}
6.4.2
{% endblock %}

{% block fetch %}
https://github.com/IBM/plex/archive/refs/tags/v{{self.version().strip()}}.tar.gz
fef6219ddad5dca93ad6973910606ec63d9ee94ddf9171e8a09a78a8e349d59e
{% endblock %}
