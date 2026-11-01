{% block version %}
8.0.1
{% endblock %}

{% block py_ver %}
3.12
{% endblock %}

{% block fetch %}
https://github.com/pypy/pypy/archive/refs/tags/release-pypy{{self.py_ver().strip()}}-v{{self.version().strip()}}.tar.gz
91ffc5c077d2281c2b111013c5ee212bbfa063a609aa3a35ceeeab385d4d1c85
{% endblock %}
