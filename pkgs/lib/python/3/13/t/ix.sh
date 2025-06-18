{% extends '//lib/python/3/12/t/ix.sh' %}

{% block pkg_name %}
python
{% endblock %}

{% block version %}
3.13.5
{% endblock %}

{% block fetch %}
https://www.python.org/ftp/python/{{self.version().strip()}}/Python-{{self.version().strip()}}.tar.xz
93e583f243454e6e9e4588ca2c2662206ad961659863277afcdb96801647d640
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
