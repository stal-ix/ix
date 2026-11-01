{% extends '//lib/glaze/ix.sh' %}

# noauto

{% block version %}
7.9.1
{% endblock %}

{% block fetch %}
https://github.com/stephenberry/glaze/archive/refs/tags/v{{self.version().strip()}}.tar.gz
d6dee391276f5375672c35d06058e4fd8f1f30f62bae163a004b3bd13a4e2ae3
{% endblock %}
