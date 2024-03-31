{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/bcrypt/archive/e8270a3fa761d9301199f828af90a67e2721c7a8.zip
{% endblock %}

{% block go_sha %}
bc6036393794c97638c3510ba69381bb7087b0335281f652bddfc76c2cb263e6
{% endblock %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp bcrypt ${out}/bin/
{% endblock %}

{% block go_version %}
v3
{% endblock %}
