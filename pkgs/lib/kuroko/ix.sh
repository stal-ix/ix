{% extends '//bin/kuroko/ix.sh' %}

{% block bld_tool %}
{{super()}}
bin/kuroko
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|./kuroko |kuroko |g' -i Makefile
{% endblock %}
