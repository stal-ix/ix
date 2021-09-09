{% extends '//util/env.py' %}

{% block env %}
export LD=clang
{% if mix.platform.target.os == 'darwin' %}
export LDFLAGS="-fuse-ld=lld.darwinnew $LDFLAGS"
{% else %}
export LDFLAGS="-fuse-ld=lld $LDFLAGS"
{% endif %}
{% endblock %}
