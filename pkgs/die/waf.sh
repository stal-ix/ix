{% extends 'wafbase.sh' %}

{% block std_box %}
bin/waf
{{super()}}
{% endblock %}

{% block step_patch %}
find . -type d -name waflib | while read l; do
    rm -rf "${l}"
done

find . -type f -name waf | while read l; do
    rm "${l}"
done

{{super()}}
{% endblock %}

{% block configure %}
cp $(which waf) ./
{{super()}}
{% endblock %}
