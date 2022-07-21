{% extends '//die/c/c_std.sh' %}

{% block fetch %}
https://github.com/nothings/stb/archive/af1a5bc352164740c1cc1354942b1c6b72eacb8a.zip
sha:e3d0edbecd356506d3d69b87419de2f9d180a98099134c6343177885f6c2cbef
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block install %}
mkdir ${out}/include
cp *.h ${out}/include/
{% endblock %}
