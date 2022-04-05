{% extends '//bin/bison/3/8/mix.sh' %}

{% block bison_bootstrap %}
bin/bison/3/7
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|%header|%defines|' -i src/parse-gram.y
{% endblock %}
