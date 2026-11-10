import QtQuick
import Quickshell
import Quickshell.Wayland

Scope {
    id: root

    property var screenNames: []
    property color color: "black"
    default property Component content

    Variants {
        model: root.screenNames.length > 0 ? Quickshell.screens.filter(s => root.screenNames.includes(s.name)) : Quickshell.screens

        PanelWindow {
            required property var modelData

            screen: modelData
            color: root.color

            anchors {
                top: true
                bottom: true
                left: true
                right: true 
            }

            WlrLayershell.layer: WlrLayer.Background
            WlrLayershell.exclusionMode: ExclusionMode.Ignore
            WlrLayershell.namespace: "background"

            Loader {
                anchors.fill: parent
                sourceComponent: root.content
            }
        }
    }
}
