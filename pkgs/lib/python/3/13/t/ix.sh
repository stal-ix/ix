{% extends '//lib/python/3/12/t/ix.sh' %}

{% block pkg_name %}
python
{% endblock %}

{% block version %}
3.13.8
{% endblock %}

{% block fetch %}
https://www.python.org/ftp/python/{{self.version().strip()}}/Python-{{self.version().strip()}}.tar.xz
b9910730526b298299b46b35595ced9055722df60c06ad6301f6a4e2c728a252
{% endblock %}

{% block configure_flags %}
{{super()}}
{% if py_no_gil %}
--without-gil
{% endif %}
{% if py_jit %}
--enable-experimental-jit
{% endif %}
{% endblock %}
