#include "include/core/SkCanvas.h"
#include "include/core/SkStream.h"
#include "modules/svg/include/SkSVGDOM.h"
#include "modules/svg/include/SkSVGNode.h"

int main(int argc, char** argv) {
    auto stream = SkStream::MakeFromFile(argv[1]);

    if (!stream) {
        abort();
    }

    auto dom = SkSVGDOM::Builder().make(*stream);

    if (!dom) {
        abort();
    }

    dom->setContainerSize(SkSize::Make(256, 256));
}
