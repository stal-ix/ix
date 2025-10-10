{% extends '//lib/python/3/12/t/ix.sh' %}

{% block pkg_name %}
python
{% endblock %}

{% block version %}
3.14.0
{% endblock %}

{% block conf_ver %}
2/72
{% endblock %}

{% block fetch %}
https://www.python.org/ftp/python/{{self.version().strip()}}/Python-{{self.version().strip()}}.tar.xz
2299dae542d395ce3883aca00d3c910307cd68e0b2f7336098c8e7b7eee9f3e9
{% endblock %}

{% block cpp_defines %}
USE_SSL=1
USE_NDBM=1
HAVE_NDBM_H=1
SQLITE_OMIT_LOAD_EXTENSION=1
{% endblock %}

{% block c_flags %}
{{super()}}
-Wno-incompatible-function-pointer-types
{% endblock %}
