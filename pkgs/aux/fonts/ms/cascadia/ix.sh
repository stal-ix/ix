{% extends '//die/fonts.sh' %}

{% block pkg_name %}
cascadia-code
{% endblock %}

{% block version %}
2407.24
{% endblock %}

{% block fetch %}
https://github.com/microsoft/cascadia-code/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:4ea145a56f35a61d8b5523b949df166b21e5db57313ba4223c490accbf816822
{% endblock %}
