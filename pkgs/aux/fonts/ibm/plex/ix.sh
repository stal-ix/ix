{% extends '//die/fonts.sh' %}

{% block pkg_name %}
IBM-plex
{% endblock %}

{% block version %}
6.0.0
{% endblock %}

{% block fetch %}
https://github.com/IBM/plex/releases/download/v{{self.version().strip()}}/OpenType.zip
sha:a26a2b220181bd9097c5badb9a5b9de5cada25abd6267bd678bd5e390203454d
{% endblock %}
