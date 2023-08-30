{% extends 't/ix.sh' %}

{% block fetch %}
https://github.com/kuroko-lang/kuroko/archive/refs/tags/v1.4.0.tar.gz
sha:55c143761da9b3ed0f523b9f7828dc04fc8e02280783274376dbbd335866c95d
{% endblock %}

{% block build_flags %}
{{super()}}
wrap_cc
{% endblock %}

{% block patch %}
{{super()}}
find . -type f | while read l; do
    sed -e 's|lib/kuroko|share|' -i ${l}
done
{% endblock %}
