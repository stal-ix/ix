{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v0.41.0.tar.gz
{% endblock %}

{% block go_sha %}
af7bd7325ca0e9ee664269d49883ecc5882fa85ae8c883fd3aefac54d85b7a9a
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lazygit ${out}/bin/
{% endblock %}

{% block go_version %}
v3
{% endblock %}
