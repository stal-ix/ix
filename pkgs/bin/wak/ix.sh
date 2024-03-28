{% extends '//die/c/ix.sh' %}

{% block git_repo %}
https://github.com/raygard/wak
{% endblock %}

{% block git_commit %}
dca8c09e9e20581330dd930b0219b07f431f2388
{% endblock %}

{% block git_sha %}
020c66792dc53ad8babda721bc574c2b8afc87e6c87b827f831dfd74aa35d310
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block build %}
cc monosrc/mono.c -o wak
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp wak ${out}/bin/
{% endblock %}

