{% extends '//die/std/ix.sh' %}

{% block git_repo %}
https://github.com/jgmdev/wl-color-picker
{% endblock %}

{% block git_commit %}
ec88e430ba4c1e06df50f07def1772a7e247edcb
{% endblock %}

{% block git_sha %}
730b2f208e5b84f6fa841b52da3264d746d50d0bab027a1cbad953db3365b5a8
{% endblock %}

{% block install %}
mkdir -p ${out}/share/icons/hicolor/scalable/apps
mkdir -p ${out}/share/applications
mkdir -p ${out}/bin

cp wl-color-picker.sh ${out}/bin/wl-color-picker
cp wl-color-picker.png ${out}/share/icons/
cp wl-color-picker.svg ${out}/share/icons/hicolor/scalable/apps/
cp wl-color-picker.desktop ${out}/share/applications/
{% endblock %}
