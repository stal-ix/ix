{% extends 't/ix.sh' %}

{% block std_env %}
{{super()}}
bld/wrapcc
{% endblock %}

{% block env %}
{{super()}}
export COFLAGS="--with-xxhash=${out} --with-libxxhash-prefix=${out} \${COFLAGS}"
{% endblock %}
