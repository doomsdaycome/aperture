import QtQuick

Item {
    id: root

    property string path: ""
    property string fit: "cover"

    property real offsetX: 0
    property real offsetY: 0

    anchors.fill: parent

    readonly property real sx: img.implicitWidth > 0 ? width / img.implicitWidth : 1
    readonly property real sy: img.implicitHeight > 0 ? height / img.implicitHeight : 1

    readonly property real uniform: {
        switch (fit) {
        case "contain":
            return Math.min(sx, sy)

        case "fit_width":
            return sx

        case "fit_height":
            return sy

        case "original":
            return 1

        default: 
            return Math.max(sx, sy)
        }
    }

    Image {
        id: img

        source: root.path.startsWith("/") ? "file://" + root.path : root.path
        asynchronous: true
        smooth: true

        x: root.offsetX
        y: root.offsetY

        width: implicitWidth * (root.fit === "stretch" ? root.sx : root.uniform)
        height: implicitHeight * (root.fit === "stretch" ? root.sy : root.uniform)
    }
}
