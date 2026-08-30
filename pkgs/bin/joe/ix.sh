{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
joe
{% endblock %}

{% block version %}
4.8
{% endblock %}

{% block fetch %}
https://sourceforge.net/projects/joe-editor/files/JOE%20sources/joe-{{self.version().strip()}}/joe-{{self.version().strip()}}.tar.gz
6995b28ee20dcdbbcb5a45a4c110642dc96d67748aea27450c74cdb4dd07cc20
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}

{% block cpp_defines %}
_GNU_SOURCE=1
{% endblock %}

{% block patch %}
patch -p1 <<'EOF'
{% include 'musl-stdin.patch' %}
EOF
{% endblock %}
