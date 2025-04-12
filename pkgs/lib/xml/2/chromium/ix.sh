{% extends '//lib/xml/2/latest/ix.sh' %}

{% block version %}
2.11.4
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libxml2/-/archive/v{{self.version().strip()}}/libxml2-v{{self.version().strip()}}.tar.bz2
sha:a9493ae091f58037dd5e73fc6035a4907eae58e2cc4756abc4e6253ee6036166
{% endblock %}
