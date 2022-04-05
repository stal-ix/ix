{% extends '//lib/c++/any/mix.sh' %}

{% block install %}
{{super()}}
sed -e 's|.*RANGES.*||' -i ${out}/include/__config_site
{% endblock %}
