{% extends '//lib/c++/any/ix.sh' %}

{% block install %}
{{super()}}
sed -e 's|.*RANGES.*||' -i ${out}/include/__config_site
{% endblock %}
