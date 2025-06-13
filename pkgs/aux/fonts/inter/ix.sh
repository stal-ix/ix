{% extends '//die/fonts.sh' %}

{% block pkg_name %}
inter
{% endblock %}

{% block version %}
4.1
{% endblock %}

{% block fetch %}
https://github.com/rsms/inter/releases/download/v{{self.version().strip()}}/Inter-{{self.version().strip()}}.zip
9883fdd4a49d4fb66bd8177ba6625ef9a64aa45899767dde3d36aa425756b11e
{% endblock %}

{% block skip_dirs %}0{% endblock %}
