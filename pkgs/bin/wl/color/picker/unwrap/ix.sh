{% extends '//die/std/ix.sh' %}

{% block git_repo %}
https://github.com/jgmdev/wl-color-picker
{% endblock %}

{% block git_commit %}
ec88e430ba4c1e06df50f07def1772a7e247edcb
{% endblock %}

{% block git_sha %}
c04e49dd0b6a8c0d8f7efcc881b8dfa2aead2f61ec5f53e49d1219cc16fa8a68
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
