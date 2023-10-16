{% extends '//lib/heif/t/ix.sh' %}

{% block bld_libs %}
lib/z
lib/png
lib/jpeg
lib/jpeg/open
lib/gdk/pixbuf
{{super()}}
{% endblock %}

{% block cmake_flags %}
{{super()}}
WITH_JPEG_DECODER=ON
WITH_JPEG_ENCODER=ON
WITH_OpenJPEG_DECODER=ON
WITH_OpenJPEG_ENCODER=ON
{% endblock %}
