{% extends '//lib/icu/t/mix.sh' %}

{% block run_data %}
lib/icu/data
{% endblock %}

{% block cpp_defines %}
{{super()}}
ICU_DATA_DIR=\\\"${ICU_DATA}\\\"
{% endblock %}

{% block install %}
{{super()}}

cd ${out}

rm -r share

find . -type f | grep '\.pc' | while read l; do
    sed -e 's|^#.*||' -i ${l}
done
{% endblock %}
