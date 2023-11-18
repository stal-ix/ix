{% extends '//lib/sdl/2/t/ix.sh' %}

{% block lib_deps %}
lib/iconv
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
