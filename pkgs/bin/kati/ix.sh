{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://github.com/google/kati
{% endblock %}

{% block git_commit %}
e37cedd24e76b59887f2153ca56dc6d4e8065d72
{% endblock %}

{% block git_sha %}
2602507afb2f1bd42a0df0d393b8aab8abc9e2380f47977119a4c3766cc52fae
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
