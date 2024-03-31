{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://github.com/google/kati
{% endblock %}

{% block git_commit %}
e37cedd24e76b59887f2153ca56dc6d4e8065d72
{% endblock %}

{% block git_sha %}
ef07c73917e326f912852b4db19282ed4bd7f4b1b33598c18e63dcf2e630c463
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/fakegit
{% endblock %}

{% block make_targets %}
ckati
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ckati ${out}/bin/
{% endblock %}
