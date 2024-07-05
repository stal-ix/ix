#include "include/core/SkCanvas.h"
#include "include/core/SkStream.h"
#include "modules/skresources/include/SkResources.h"
#include "modules/skshaper/utils/FactoryHelpers.h"
#include "modules/svg/include/SkSVGDOM.h"
#include "modules/svg/include/SkSVGNode.h"
#include "src/utils/SkOSPath.h"
#include "tools/fonts/FontToolUtils.h"

int main(int argc, char** argv) {
    auto stream = SkStream::MakeFromFile(argv[1]);

    if (!stream) {
        abort();
    }

    auto predecode = skresources::ImageDecodeStrategy::kPreDecode;

    auto dom = SkSVGDOM::Builder()
        .setTextShapingFactory(SkShapers::BestAvailable())
        .make(*stream);

    if (!dom) {
        abort();
    }

    dom->setContainerSize(SkSize::Make(256, 256));
}
