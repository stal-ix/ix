{% extends '//bin/zathura/t/ix.sh' %}

{% block fetch %}
https://pwmt.org/projects/zathura-djvu/download/zathura-djvu-0.2.10.tar.xz
sha:32e9d89929a76cd7d3fcbaf79f441868bdabedf17317d1d1843faa1f19338d95
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/djvulibre
{% endblock %}
