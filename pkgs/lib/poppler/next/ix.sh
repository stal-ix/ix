{% extends '//lib/poppler/ix.sh' %}

{% block fetch %}
https://poppler.freedesktop.org/poppler-24.06.1.tar.xz
sha:1e629e8732286c745fbc0b15a3ee591443fb37a2210856e7f3ec38a0fb93ab13
{% endblock %}

{% block setup_target_flags %}
export CPPFLAGS="-Wno-register ${CPPFLAGS}"
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|.*static_assert.*Z_NULL.*||' -i poppler/FlateEncoder.cc
{% endblock %}
