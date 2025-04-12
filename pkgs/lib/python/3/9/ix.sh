{% extends '//lib/python/3/8/ix.sh' %}

{% block version %}
3.9.18
{% endblock %}

{% block fetch %}
https://www.python.org/ftp/python/{{self.version().strip()}}/Python-{{self.version().strip()}}.tar.xz
sha:01597db0132c1cf7b331eff68ae09b5a235a3c3caa9c944c29cac7d1c4c4c00a
{% endblock %}
