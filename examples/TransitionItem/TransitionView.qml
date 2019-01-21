/****************************************************************************
**
** Copyright (C) 2018 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of Qt Quick Designer Components.
**
** $QT_BEGIN_LICENSE:GPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 or (at your option) any later version
** approved by the KDE Free Qt Foundation. The licenses are as published by
** the Free Software Foundation and appearing in the file LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.10
import TransitionItem 1.0

Item {
    id: root
    width: 200
    height: 200

    property PageTransition defaultTransition

    property PageTransition currentTransition
    property PageTransition __forceTransition

    property list<PageTransition> transitions

    enum EffectEnum {
        Instant,
        Dissolve,
        Fade,
        Pop
    }

    default property alias item: stack.children

    property Item currentItem
    property int currentIndex: 0

    property int maxIndex: 0

    Item {
        id: stack
        visible: false
    }

    Component.onCompleted: {
        root.maxIndex = stack.children.length - 1

        root.allChildren = []

        for (var i = 0; i < stack.children.length; ++i) {
            root.allChildren.push(stack.children[i])
        }

        /* Assign view to all transitions */
        if (defaultTransition) {
            defaultTransition.transitionView = root
        }

        for (i = 0; i < root.transitions.length; ++i) {
            var t = root.transitions[i]
            t.transitionView = root
        }

        __setupCurrentItem()
    }

    onCurrentIndexChanged: {
        var nextItem = root.allChildren[root.currentIndex]

        var pageTransition = null

        /* find correct transition */
        for (var i = 0; i < root.transitions.length; ++i) {
            var t = root.transitions[i]
            if ((t.from === root.currentItem) && (t.to === nextItem)) {
                pageTransition = t
            }
        }

        if (pageTransition !== null) {

        } else {
            pageTransition = root.defaultTransition
        }

        if (root.currentTransition)
            root.currentTransition.__stop()

        /* If a specific transition is forced then use this one. */
        if (__forceTransition)
            pageTransition = __forceTransition
        __forceTransition = null

        pageTransition.__start(root.currentItem, nextItem)
    }

    function __setupCurrentItem() {
        if (root.currentItem)
            root.currentItem.parent = stack

        root.currentItem = root.allChildren[root.currentIndex]

        root.currentItem.parent = root
        root.currentTransition = null
    }

    function gotoPage(transition) {
        var page = transition.page
        /* There might be another transition that fits. We are forcing this one. */
        __forceTransition = transition
        for (var i = 0; i < root.allChildren.length; ++i) {
            if (page === root.allChildren[i]) {
                root.currentIndex = i
            }
        }
    }

    property var allChildren

    property Item __fromContentItem: Item {
        width: root.width
        height: root.height
        parent: root
    }

    property Item __toContentItem: Item {
        width: root.width
        height: root.height
        parent: root
    }
}
