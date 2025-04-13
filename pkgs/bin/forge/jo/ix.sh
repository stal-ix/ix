{% extends '//die/go/build.sh' %}

{% block version %}
10.0.3
{% endblock %}

{% block go_url %}
https://codeberg.org/forgejo/forgejo/archive/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
3aec93a137885919d786ca9b66b4ed497c036d87e4e7503c02b0df64f657151f
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gitea ${out}/bin/forgejo
{% endblock %}
