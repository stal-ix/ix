{% extends '//lib/musl/package.sh' %}

{% block deps %}
# bld boot/stage/3/make
# bld boot/stage/2/env
{% endblock %}

{% block relinkmusl %}{% endblock %}
{% block cflags %}{% endblock %}
{% block extractalloc %}{% endblock %}
