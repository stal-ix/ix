{% extends '//bin/python/lite/ix.sh' %}

{% block bld_libs %}
lib/bzip/2
{{super()}}
{% endblock %}

{% block extra_modules %}
{{super()}}
_bz2 _bz2module.c
{% endblock %}
