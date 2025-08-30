{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://github.com/jedisct1/dsvpn
{% endblock %}

{% block git_commit %}
878b236dcd9be8c44885bd8fb40f074b518bbfee
{% endblock %}

{% block git_sha %}
2a0d16b51508835554b9e9f4fe54a8fcd511a8a59e76e5e917a93f8662c2f0a0
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/sbin ${out}/bin
{% endblock %}
