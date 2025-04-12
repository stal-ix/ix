{% extends '//die/fonts.sh' %}

{% block version %}
2404.23
{% endblock %}

{% block fetch %}
https://github.com/microsoft/cascadia-code/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:826aaefb4bb0185f6f9957eca63bfcbc3542d46615481f2646741c39e8f0c59e
{% endblock %}
