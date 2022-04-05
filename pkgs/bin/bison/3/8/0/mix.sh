{% extends '//bin/bison/3/8/mix.sh' %}

{% block bison_bootstrap %}
bld/bison
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block configure_flags %}
{{super()}}
--disable-nls
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|%header|%defines|' -i src/parse-gram.y
{% endblock %}
