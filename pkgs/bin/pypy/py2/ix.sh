{% extends '//bld/python/2/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/expat/dl
bin/pypy/externmod/dl
{% endblock %}
