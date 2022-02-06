{% extends '//lib/xz/t/mix.sh' %}

{% block bld_libs %}
lib/intl
lib/iconv
{{super()}}
{% endblock %}
