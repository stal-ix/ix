{% extends '//lib/sdl/2/t/ix.sh' %}

{% block lib_deps %}
lib/iconv
lib/opengl
lib/darwin/framework/Metal
lib/darwin/framework/Cocoa
lib/darwin/framework/IOKit
lib/darwin/framework/AppKit
lib/darwin/framework/Carbon
lib/darwin/framework/CoreAudio
lib/darwin/framework/CoreVideo
lib/darwin/framework/CoreHaptics
lib/darwin/framework/AudioToolbox
lib/darwin/framework/ForceFeedback
lib/darwin/framework/GameController
{{super()}}
{% endblock %}

{% block bld_tool %}
bld/cctools
{{super()}}
{% endblock %}

{% block build_flags %}
shut_up
{{super()}}
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|.*context movedToNewScreen.*||' \
    -i src/video/cocoa/SDL_cocoawindow.m
{% endblock %}
