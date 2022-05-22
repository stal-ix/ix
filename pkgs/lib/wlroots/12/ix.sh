{% extends '//lib/wlroots/14/ix.sh' %}

{% block fetch %}
https://github.com/swaywm/wlroots/archive/refs/tags/0.12.0.tar.gz
sha:c9e9f4f6d2f526d0b2886daf3ec37e64831773059aa669fb98a88522a1626bdb
{% endblock %}

{% block meson_flags %}
xwayland=disabled
{% endblock %}
