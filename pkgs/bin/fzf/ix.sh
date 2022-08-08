{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/0.32.1.tar.gz
{% endblock %}

{% block go_sum %}
sha:c7afef61553b3b3e4e02819c5d560fa4acf33ecb39829aeba392c2e05457ca6a
{% endblock %}

{% block go_sha %}
sha:e6db879923af22e9a3010cce4f32283acce4c839d3c3c134c9a6c6bfa9121ff4
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}
