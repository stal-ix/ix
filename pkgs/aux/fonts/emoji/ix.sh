{% extends '//die/fonts.sh' %}

{% block pkg_name %}
EmojiLibrary
{% endblock %}

{% block version %}
0.18.4
{% endblock %}

{% block fetch %}
https://github.com/PoomSmart/EmojiLibrary/releases/download/{{self.version().strip()}}/AppleColorEmoji-160px.ttf
sha:8e1b52ee973af2ab3e677d765af673c211e74dcb363926db447cef0ef2ffe695
{% endblock %}

{% block step_unpack %}
mkdir src
cd src
cp ${src}/*.ttf ./
{% endblock %}
