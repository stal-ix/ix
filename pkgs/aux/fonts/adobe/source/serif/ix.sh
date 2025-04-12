{% extends '//die/fonts.sh' %}

{% block version %}
4.004
{% endblock %}

{% block fetch %}
https://github.com/adobe-fonts/source-serif/releases/download/{{self.version().strip()}}R/source-serif-{{self.version().strip()}}.zip
sha:cb3e95d6e3c1273d44300dd464e568d4c9613b28199c53c50454af4b40bbdac1
{% endblock %}
