{% extends '//lib/icu/t/lib/ix.sh' %}

{% block install %}
{{super()}}

cd ${out}

rm -r share

find . -type f -name '*.pc' | while read l; do
    sed -e 's|^#.*||' -i ${l}
done
{% endblock %}
