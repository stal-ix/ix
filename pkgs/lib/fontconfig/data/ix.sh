{% extends '//lib/fontconfig/t/ix.sh' %}

{% block install %}
{{super()}}

cd ${out}

find . -type f -name '*.conf' | while read l; do
    sed -e 's|.*/usr.*||' -e 's|.*/var.*||' -i ${l}
done
{% endblock %}

{% block env %}
export FONTCONFIG_DATA="${out}"
{% endblock %}
