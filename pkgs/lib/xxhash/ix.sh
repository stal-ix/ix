{% extends 't/ix.sh' %}

{% block env %}
{{super()}}
export COFLAGS="--with-xxhash=${out} --with-libxxhash-prefix=${out} \${COFLAGS}"
{% endblock %}
