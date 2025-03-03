{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/v0.60.3.tar.gz
{% endblock %}

{% block go_sha %}
af0fdfb4fc8681dcf763ad0e34bcd86ab4e1975aae6a39b0d1b7844fd09f1752
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}
