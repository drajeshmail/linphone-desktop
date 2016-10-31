import QtQuick 2.7
import QtQuick.Layouts 1.3

import Common 1.0
import Linphone.Styles 1.0

// ===================================================================

ColumnLayout {
  property alias model: view.model

  spacing: 0

  Rectangle {
    Layout.fillWidth: true
    Layout.preferredHeight: TimelineStyle.legend.height
    color: TimelineStyle.legend.backgroundColor

    // Legend.
    Row {
      anchors {
        fill: parent
        leftMargin: TimelineStyle.legend.leftMargin
        rightMargin: TimelineStyle.legend.rightMargin
      }
      spacing: TimelineStyle.legend.spacing

      Icon {
        anchors.verticalCenter: parent.verticalCenter
        icon: 'history'
        iconSize: TimelineStyle.legend.iconSize
      }

      Text {
        color: TimelineStyle.legend.color
        font.pointSize: TimelineStyle.legend.fontSize
        height: parent.height
        text: qsTr('timelineTitle')
        verticalAlignment: Text.AlignVCenter
      }
    }
  }

  // History.
  ScrollableListView {
    id: view

    Layout.fillHeight: true
    Layout.fillWidth: true

    delegate: Contact {
      color: index % 2 == 0
        ? TimelineStyle.contact.colorA
        : TimelineStyle.contact.colorB
      contact: $contact
      height: TimelineStyle.contact.height
      width: parent.width
    }
  }
}