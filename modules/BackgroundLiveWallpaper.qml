import QtQuick
import QtMultimedia

Item {
    id: root

    property string path: ""
    property string fit: "cover"
    property real offsetX: 0
    property real offsetY: 0
    property bool loop: true

    anchors.fill: parent

    readonly property real sx: video.sourceRect.width > 0 ? width / video.sourceRect.width : 1
    readonly property real sy: video.sourceRect.height > 0 ? height / video.sourceRect.height : 1

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

    MediaPlayer {
        id: player

        source: root.path.startsWith("/") ? "file://" + root.path : root.path
        videoOutput: video
        loops: root.loop ? MediaPlayer.Infinite : 1

        Component.onCompleted: play()
    }

    VideoOutput {
        id: video

        fillMode: VideoOutput.Stretch

        x: root.offsetX
        y: root.offsetY

        width: video.sourceRect.width * (root.fit === "stretch" ? root.sx : root.uniform)
        height: video.sourceRect.height * (root.fit === "stretch" ? root.sy : root.uniform)
    }
}
