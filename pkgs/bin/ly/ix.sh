{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/fairyglade/ly/archive/refs/tags/v0.5.3.tar.gz
sha:ddbd8bd6d7a00867d269154c564d0c059f2d5b0df111e1995b4abfbb89f683d5
https://github.com/nullgemm/argoat/archive/e1844c4c94b70bb351ec2bd2ac6bb320ee793d8f.zip
sha:61c93031bc3ed80a79c877708020e1c9a687b97da68c3765a7d0822c328715a1
https://github.com/nullgemm/configator/archive/8cec1786196ae6f6a8b35e66181277457f2a2bb2.zip
sha:788c9b2df5b02aa61500c1e430793a19d7e99ac40558b2634bf2f97fb83926c4
https://github.com/nullgemm/dragonfail/archive/15bd3299bf3e49bd6734bff385cb0392cd2fa502.zip
sha:3594f86563bc8b13c5cb21f14930da00b1666a2af8cc4f9b709a88192282dd11
https://github.com/nullgemm/termbox_next/archive/d961a8122210010e7c2c8f201e61170c13d319b4.zip
sha:57189a8834e20c9ba98e6e8cb6e5bf2e199c369f4bf4d6c135fecf5b696ddf6f
{% endblock %}

{% block unpack %}
mkdir src; cd src
extract 1 ${src}/v*
cd sub
(cd ar*; extract 1 ${src}/e1*)
(cd co*; extract 1 ${src}/8c*)
(cd dr*; extract 1 ${src}/15*)
(cd te*; extract 1 ${src}/d9*)
cd ..
{% endblock %}

{% block bld_libs %}
lib/c
lib/pam
lib/kernel
lib/shim/x11
{% endblock %}

{% block bld_tool %}
bld/fakegit
{% endblock %}

{% block make_flags %}
DESTDIR=${out}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv usr/* ./
rm -r usr
{% endblock %}
