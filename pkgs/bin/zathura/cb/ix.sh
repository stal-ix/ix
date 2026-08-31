{% extends '//bin/zathura/t/ix.sh' %}

{% block pkg_name %}
zathura-cb
{% endblock %}

{% block version %}
2026.07.18
{% endblock %}

{% block fetch %}
https://github.com/pwmt/zathura-cb/archive/refs/tags/{{self.version().strip()}}.tar.gz
6cb21bde6ca9f92ed409a44f37fc58de5d4fa13a99bd3ae37de0542d6818857f
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/archive
lib/gtk/4
{% endblock %}
