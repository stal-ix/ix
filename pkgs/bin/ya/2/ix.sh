{% extends '//bin/ya/t/ix.sh' %}

{% block fetch %}
https://github.com/pg83/yaboot/archive/refs/tags/1.tar.gz
sha:80266d00f71380ec78c7c31a52ef56d624030ffa636403b5f5c1f0f42e1927c5
{% endblock %}

{% block git_repo %}
https://github.com/yandex/yatool
{% endblock %}

{% block git_commit %}
e7d6af6a60b41bd912f9723c946ba9464d7c8b31
{% endblock %}

{% block git_sha %}
f79044618d02b96d22aa9d0e4c51d94461e9261d1f81433d90b7e4b0e228975d
{% endblock %}

{% block step_unpack %}
{{super()}}
extract 1 ${src}/1.tar.gz
{% endblock %}

{% block bld_tool %}
bin/ya/1
{{super()}}
{% endblock %}

{% block ya_c_flags %}
-Wno-error
{% endblock %}

{% block ya_make_targets %}
devtools/ymake/bin/ymake
{% endblock %}
