{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v0.38.2.tar.gz
{% endblock %}

{% block go_sum %}
sha:2e727db952022c0518443d18c9b8a97a882970b93c5ab198ff33bb8ed2166c2f
{% endblock %}

{% block go_sha %}
sha:4249933c65553599a17475d303fee49760006455ce944d18a5fefccaffde096a
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lazygit ${out}/bin/
{% endblock %}
