import QtQuick
import Quickshell
import Quickshell.Hyprland

Item {
    id: root

    default property alias content: container.data

    property real scaleFactor: 1.0
    property int workspaceLimit: 10
    property real shiftWidth: 10
    property bool vertical: false
    property bool animated: true
    property int animationDuration: 100
    property int animationEasing: Easing.OutCubic

    anchors.fill: parent

    readonly property var monitor: QsWindow.window ? Hyprland.monitorFor(QsWindow.window.screen) : null
    readonly property int currentId: monitor?.activeWorkspace?.id ?? 1

    property int workspaceId: 1
    onCurrentIdChanged: if (currentId > 0) workspaceId = currentId

    readonly property int index: Math.min(Math.max(workspaceId, 1), workspaceLimit) - 1
    readonly property real shift: shiftWidth * index

    Item {
        id: container
        width: root.width
        height: root.height
        scale: root.scaleFactor
        transformOrigin: Item.TopLeft
        x: root.vertical ? 0 : -root.shift
        y: root.vertical ? -root.shift : 0

        Behavior on x {
            enabled: root.animated
            NumberAnimation { duration: root.animationDuration; easing.type: root.animationEasing }
        }
        Behavior on y {
            enabled: root.animated
            NumberAnimation { duration: root.animationDuration; easing.type: root.animationEasing }
        }
    }
}
