#include "include/core/SkCanvas.h"
#include "include/core/SkStream.h"
#include "include/core/SkPixmap.h"
#include "encode/SkPngEncoder.h"
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

    auto w = 192;
    auto h = 192;

    auto pixels = new SkPMColor[w * h];
    auto canvas = SkCanvas::MakeRasterDirectN32(w, h, pixels, w * 4);

    if (!canvas) {
        abort();
    }

    auto cs = dom->containerSize();
    canvas->scale((double)w / cs.width(), (double)h / cs.height());

    dom->render(canvas.get());

    SkPixmap pixmap;

    if (!canvas->peekPixels(&pixmap)) {
        abort();
    }

    SkFILEWStream out(argv[2]);

    if (!out.isValid()) {
        abort();
    }

    if (!SkPngEncoder::Encode(&out, pixmap, SkPngEncoder::Options())) {
        abort();
    }
}
