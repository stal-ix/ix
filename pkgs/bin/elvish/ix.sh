{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/elves/elvish/archive/refs/tags/v0.20.0.tar.gz
{% endblock %}

{% block go_sha %}
e13ec9dcb66e4d7d435c257241f99b785272ae2cb84a6c55e615ab775c28be19
{% endblock %}

{% block go_refine %}
find . -type l -delete
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/elvish
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp elvish ${out}/bin/
{% endblock %}
