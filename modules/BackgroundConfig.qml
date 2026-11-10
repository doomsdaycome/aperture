import QtQuick

Item {
    id: root

    property int index: 0

    property list<Component> wallpapers: [
        Component {
            BackgroundWallpaper {
                path: "/home/jacobkolinski/Pictures/Wallpapers/GKaTN4hboAAtMbu.png"
                fit: "cover"
            }
        },
        Component {
            BackgroundWallpaper {
                path: "/home/jacobkolinski/Downloads/d3d680430b6d9bd0341eab801bf02443513625460.jpg"
                fit: "cover"
            }
        },
        Component {
            BackgroundParallax {
                scaleFactor: 1.07
                shiftWidth: 16.5
                animationDuration: 650

                BackgroundLiveWallpaper {
                    path: "/home/jacobkolinski/Videos/Live Wallpapers/爱弥斯雨天窗外-预合成 6-0000647.mp4"
                    fit: "cover"
                }
            }
        }
    ]

    Loader {
        anchors.fill: parent
        sourceComponent: root.wallpapers[root.index]
    }
}
