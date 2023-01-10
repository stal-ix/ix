{% extends '//bin/zathura/t/ix.sh' %}

{% block fetch %}
https://pwmt.org/projects/zathura-djvu/download/zathura-djvu-0.2.9.tar.xz
sha:96e6f8a6ee53231073b2f7003264872f84501e63c3da7bf0598d046286b0c200
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/djvulibre
{% endblock %}
