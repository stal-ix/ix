{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v0.40.2.tar.gz
{% endblock %}

{% block go_sha %}
4f13c7aeb1df8535a2f106baf6727a272c5c5746e65dde4834b8eddade306336
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lazygit ${out}/bin/
{% endblock %}
