{% extends '//lib/python/3/12/t/ix.sh' %}

{% block fetch %}
https://www.python.org/ftp/python/3.13.2/Python-3.13.2.tar.xz
sha:d984bcc57cd67caab26f7def42e523b1c015bbc5dc07836cf4f0b63fa159eb56
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
