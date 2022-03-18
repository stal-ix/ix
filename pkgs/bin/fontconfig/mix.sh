{% extends '//lib/fontconfig/t/mix.sh' %}

{% block bld_libs %}
lib/intl
lib/iconv
{{super()}}
{% endblock %}
