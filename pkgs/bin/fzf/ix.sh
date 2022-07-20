{% extends '//die/cgo.sh' %}

{% block fetch %}
https://github.com/junegunn/fzf/archive/refs/tags/0.30.0.tar.gz
sha:a3428f510b7136e39104a002f19b2e563090496cb5205fa2e4c5967d34a20124
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}
