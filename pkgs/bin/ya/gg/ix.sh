{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/gg/archive/70e1aaf7d57286a5f35ee7975b19105e4c542e88.zip
{% endblock %}

{% block go_sha %}
9afa84833f564565c5b097f49d1afb10c3c3885616474a0b70f2c0b819a835c4
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gg ${out}/bin/ya
{% endblock %}
