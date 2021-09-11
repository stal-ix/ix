{% extends '//lib/musl/package.sh' %}

{% block deps %}
# dep boot/stage/3/make boot/stage/2/env
{% endblock %}

{% block relinkmusl %}{% endblock %}
{% block cflags %}{% endblock %}
{% block extractalloc %}{% endblock %}
