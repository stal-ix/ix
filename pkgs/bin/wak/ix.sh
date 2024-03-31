{% extends '//die/c/ix.sh' %}

{% block git_repo %}
https://github.com/raygard/wak
{% endblock %}

{% block git_commit %}
dca8c09e9e20581330dd930b0219b07f431f2388
{% endblock %}

{% block git_sha %}
4306f350539f59f6238c9234ab0f60d992bf5e0c00e78ed398fbb33da04c26a6
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
