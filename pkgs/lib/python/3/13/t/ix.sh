{% extends '//lib/python/3/12/t/ix.sh' %}

{% block fetch %}
https://www.python.org/ftp/python/3.13.0/Python-3.13.0.tar.xz
sha:086de5882e3cb310d4dca48457522e2e48018ecd43da9cdf827f6a0759efb07d
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
