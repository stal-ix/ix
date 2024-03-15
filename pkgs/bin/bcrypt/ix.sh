{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/bcrypt/archive/e8270a3fa761d9301199f828af90a67e2721c7a8.zip
{% endblock %}

{% block go_sha %}
936b3d97f5f378ba986e6c24415223ddeed0e12b186a4211c4ed647c6f91de75
{% endblock %}

{% block go_tool %}
bin/go/22
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp bcrypt ${out}/bin/
{% endblock %}
