{# the DjVu tools, c44, ddjvu, djvused and the rest, over the library:
   the whole tree but the desktop files, with the tiff the tools read
   and write #}

{% extends '//lib/djvulibre/common/ix.sh' %}

{% block lib_deps %}
{{super()}}
lib/tiff
{% endblock %}

{% block configure_flags %}
--disable-desktopfiles
{% endblock %}

{% block make_flags %}
{% endblock %}
