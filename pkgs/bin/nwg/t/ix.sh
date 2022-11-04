{% extends '//die/go/pure.sh' %}

{% block bld_libs %}
lib/c
lib/gtk/3
lib/gtk/layer/shell
{% endblock %}

{% block go_tags %}
no_x11
{% endblock %}

{% block patch %}
rm vendor/github.com/gotk3/gotk3/gtk/socket_plug*
{% endblock %}
