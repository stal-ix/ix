#include "platform/linux/integration_linux.h"

#include "platform/platform_integration.h"
#include "base/platform/base_platform_info.h"
#include "base/platform/linux/base_linux_xdp_utilities.h"
#include "core/sandbox.h"
#include "core/application.h"
#include "core/core_settings.h"
#include "base/random.h"

namespace Platform {
namespace {

class LinuxIntegration final : public Integration {
public:
	LinuxIntegration();

	void init() override;
};

LinuxIntegration::LinuxIntegration() {
}

void LinuxIntegration::init() {
}

} // namespace

std::unique_ptr<Integration> CreateIntegration() {
	return std::make_unique<LinuxIntegration>();
}

} // namespace Platform
