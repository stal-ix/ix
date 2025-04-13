{% extends '//lib/poppler/ix.sh' %}

{% block version %}
24.02.0
{% endblock %}

{% block fetch %}
https://poppler.freedesktop.org/poppler-{{self.version().strip()}}.tar.xz
sha:19187a3fdd05f33e7d604c4799c183de5ca0118640c88b370ddcf3136343222e
{% endblock %}
