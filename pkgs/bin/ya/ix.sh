{% extends '//bin/ya/t/ix.sh' %}

{% block fetch %}
https://github.com/pg83/yaboot/archive/refs/tags/1.tar.gz
sha:80266d00f71380ec78c7c31a52ef56d624030ffa636403b5f5c1f0f42e1927c5
{% endblock %}

{% block git_repo %}
https://github.com/yandex/yatool
{% endblock %}

{% block git_commit %}
eea1fb8c884fb069deea75baf3bcc470975d8876
{% endblock %}

{% block git_sha %}
99dbbe3254724b10d845f8878b2158a213eaf65dcb6d8bba7bf7e44f709b3dba
{% endblock %}

{% block step_unpack %}
{{super()}}
extract 1 ${src}/1.tar.gz
{% endblock %}

{% block bld_tool %}
bin/ya/1
{{super()}}
{% endblock %}

{% block ya_make_targets %}
devtools/ymake/bin
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp devtools/ymake/bin/ymake ${out}/bin/
{% endblock %}
