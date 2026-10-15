{% block version %}
8.0.0
{% endblock %}

{% block py_ver %}
3.12
{% endblock %}

{% block fetch %}
https://github.com/pypy/pypy/archive/refs/tags/release-pypy{{self.py_ver().strip()}}-v{{self.version().strip()}}.tar.gz
4c1fd1afbfb788373a261b31438bdb6b5ca655f286038ef5062d73b270a541f9
{% endblock %}
