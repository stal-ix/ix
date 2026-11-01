{% extends '//lib/python/3/12/t/ix.sh' %}

{% block pkg_name %}
python
{% endblock %}

{% block version %}
3.13.18
{% endblock %}

{% block fetch %}
https://www.python.org/ftp/python/{{self.version().strip()}}/Python-{{self.version().strip()}}.tar.xz
abb0102e6d4ae027509bcb82327d9dd85515b44a3ba8ad538cfc5e9847029f68
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
