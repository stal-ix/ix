{% extends '//dev/lang/bison/3.8.2//mix.sh' %}

{% block bison_bootstrap %}
dev/lang/bison/3.7.6/mix.sh
{% endblock %}

{% block bison_patch %}
sed -e 's|%header|%defines|' -i src/parse-gram.y
{% endblock %}
