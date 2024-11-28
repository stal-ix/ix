{% extends '//bin/ya/t/ix.sh' %}

{% block fetch %}
https://github.com/pg83/yaboot/archive/refs/tags/1.tar.gz
sha:80266d00f71380ec78c7c31a52ef56d624030ffa636403b5f5c1f0f42e1927c5
{% endblock %}

{% block git_repo %}
https://github.com/yandex/yatool
{% endblock %}

{% block git_commit %}
ff47bb5d587380afbc57da8a463f5f394ee8b528
{% endblock %}

{% block git_sha %}
8c53df0645d6127a109f48aa63a7578019967496b0b62b724ac0cc564ea13bd3
{% endblock %}

{% block step_unpack %}
{{super()}}
extract 1 ${src}/1.tar.gz
{% endblock %}

{% block bld_tool %}
bin/ya/0
{{super()}}
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|.*NEED_BINUTILS_PEERDIR=yes.*||' \
    -e 's|.*BINUTILS_ROOT_RESOURCE_GLOBAL.*||' \
    -i build/ymake.core.conf
{% endblock %}
