{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/0.42.0.tar.gz
{% endblock %}

{% block go_sum %}
sha:743c1bfc7851b0796ab73c6da7db09d915c2b54c0dd3e8611308985af8ed3df2
{% endblock %}

{% block go_sha %}
sha:
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}
