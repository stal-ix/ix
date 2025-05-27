{% extends '//bin/ya/bootstrap/t/ix.sh' %}

{% block git_commit %}
2c1b5b75ea9fd913cda4d28c8c18dfe38a320852
{% endblock %}

{% block git_sha %}
c0c448b86c0220eb15f5090a26dd14e68015e792281510c1f88c359a0174d5bc
{% endblock %}

{% block bld_tool %}
bin/gg
bin/ya/bootstrap/2(clang_ver=18)
{{super()}}
{% endblock %}
