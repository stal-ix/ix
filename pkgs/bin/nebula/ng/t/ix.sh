{% extends '//die/go/build.sh' %}

{% block pkg_name %}
nebula_ng
{% endblock %}

{% block version %}
e2554afe994e35855b28ea12d43877ac89e2be76
{% endblock %}

{% block go_url %}
https://github.com/pg83/nebula/archive/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
478381d72ab5c22f7bf4819eebf7dd5745dbcebcbbfce15e1fe3da7c77bdff8a
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
