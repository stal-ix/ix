{% extends '//die/go/build_v2.sh' %}

{% block go_url %}
https://github.com/go-git/go-git/archive/refs/tags/v5.4.2.tar.gz
{% endblock %}

{% block go_sha %}
f02fb68b225614a7b492dc2ad8dcba0ca1d5bb952e966806978f9b26d8fa910e
{% endblock %}

{% block unpack %}
{{super()}}
cd cli/go-git
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp go-git ${out}/bin/
{% endblock %}
