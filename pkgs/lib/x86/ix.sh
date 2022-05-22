{% extends '//die/make.sh' %}

{% block fetch %}
http://deb.debian.org/debian/pool/main/libx/libx86/libx86_1.1+ds1.orig.tar.gz
sha:3b48dc1880a1b4f8cef3934ae70e6609aa8d8fc3b1ea4cdcd4f19958d86bdbb3
http://deb.debian.org/debian/pool/main/libx/libx86/libx86_1.1+ds1-12.debian.tar.xz
sha:9f94265ea18bc1fea15a15da95f0f0eac30beb47fcaed94472b1b97b52bff525
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block patch %}
cat patches/01* | patch -p1
{% endblock %}

{% block build %}
{{super()}}
>libx86.so.1
{% endblock %}

{% block make_flags %}
BACKEND=x86emu
DESTDIR="${out}"
{% endblock %}

{% block make_target %}
static
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv usr/* .
rm -rf usr
{% endblock %}
