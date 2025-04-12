{% extends '//die/fonts.sh' %}

{% block version %}
4.0
{% endblock %}

{% block fetch %}
https://github.com/rsms/inter/releases/download/v{{self.version().strip()}}/Inter-{{self.version().strip()}}.zip
sha:ff970a5d4561a04f102a7cb781adbd6ac4e9b6c460914c7a101f15acb7f7d1a4
{% endblock %}

{% block skip_dirs %}0{% endblock %}
