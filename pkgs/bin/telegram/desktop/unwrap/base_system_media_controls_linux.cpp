#include "base/platform/base_platform_system_media_controls.h"

#include "base/integration.h"
#include "base/platform/base_platform_info.h" // IsWayland

#include <QtCore/QBuffer>
#include <QtGui/QGuiApplication>
#include <QtGui/QImage>
#include <ksandbox.h>

namespace base::Platform {

struct SystemMediaControls::Private {};

SystemMediaControls::SystemMediaControls()
{
}

SystemMediaControls::~SystemMediaControls() {
}

bool SystemMediaControls::init() {
    return false;
}

void SystemMediaControls::setApplicationName(const QString &name) {
}

void SystemMediaControls::setEnabled(bool enabled) {
}

void SystemMediaControls::setIsNextEnabled(bool value) {
}

void SystemMediaControls::setIsPreviousEnabled(bool value) {
}

void SystemMediaControls::setIsPlayPauseEnabled(bool value) {
}

void SystemMediaControls::setIsStopEnabled(bool value) {
}

void SystemMediaControls::setPlaybackStatus(PlaybackStatus status) {
}

void SystemMediaControls::setLoopStatus(LoopStatus status) {
}

void SystemMediaControls::setShuffle(bool value) {
}

void SystemMediaControls::setTitle(const QString &title) {
}

void SystemMediaControls::setArtist(const QString &artist) {
}

void SystemMediaControls::setThumbnail(const QImage &thumbnail) {
}

void SystemMediaControls::setDuration(int duration) {
}

void SystemMediaControls::setPosition(int position) {
}

void SystemMediaControls::setVolume(float64 volume) {
}

void SystemMediaControls::clearThumbnail() {
}

void SystemMediaControls::clearMetadata() {
}

void SystemMediaControls::updateDisplay() {
}

auto SystemMediaControls::commandRequests() const -> rpl::producer<SystemMediaControls::Command> {
    abort();
}

rpl::producer<float64> SystemMediaControls::seekRequests() const {
    abort();
}

rpl::producer<float64> SystemMediaControls::volumeChangeRequests() const {
    abort();
}

rpl::producer<> SystemMediaControls::updatePositionRequests() const {
    abort();
}

bool SystemMediaControls::seekingSupported() const {
    return false;
}

bool SystemMediaControls::volumeSupported() const {
    return false;
}

bool SystemMediaControls::Supported() {
    return false;
}

} // namespace base::Platform
