{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/v0.59.0.tar.gz
{% endblock %}

{% block go_sha %}
f59b4387a04cc07d88654ef722fa68f3b70396ab16babde4468f1fe3c93426db
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}
