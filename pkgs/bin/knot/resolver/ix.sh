{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
knot-resolver
{% endblock %}

{% block version %}
6.5.1
{% endblock %}

{% block fetch %}
https://secure.nic.cz/files/knot-resolver/knot-resolver-{{self.version().strip()}}.tar.xz
3b2a04626c1df9b42420960025bc94e28777744d31c567adb9580c37189aae97
{% endblock %}

{% block bld_libs %}
lib/c
lib/uv
lib/knot
lib/edit
lib/gnutls
lib/kernel
lib/cap/ng
lib/lua/jit
lib/ng/http/2
lib/protobuf/c
lib/execinfo
{% endblock %}

{% block bld_tool %}
bld/bash
bin/protoc/c
{% endblock %}

{% block patch %}
patch -p1 <<'EOF'
--- a/lib/kru-avx2.c
+++ b/lib/kru-avx2.c
@@ -25 +25 @@
-	#if !defined(__AVX2__)
+	#if !defined(__AVX2__) || !defined(__AES__)
@@ -49 +49 @@
-	#if !defined(__AVX2__)
+	#if !defined(__AVX2__) || !defined(__AES__)
EOF
{% endblock %}

{% block meson_strip_dirs %}
{% endblock %}
