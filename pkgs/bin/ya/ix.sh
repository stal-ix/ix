{% extends '//bin/ya/t/ix.sh' %}

{% block fetch %}
https://github.com/pg83/yaboot/archive/refs/tags/1.tar.gz
sha:80266d00f71380ec78c7c31a52ef56d624030ffa636403b5f5c1f0f42e1927c5
{% endblock %}

{% block git_repo %}
https://github.com/yandex/yatool
{% endblock %}

{% block git_commit %}
702f80b1a7d3500072cc3a0d65b2bcff6cd6f4e5
{% endblock %}

{% block git_sha %}
8655dee89e25e68a21f4caaf4315529415ebd593ecbd7ce5d0a99960ce653f46
{% endblock %}

{% block step_unpack %}
{{super()}}
extract 1 ${src}/1.tar.gz
{% endblock %}

{% block bld_tool %}
bin/ya/1
{{super()}}
{% endblock %}
