qt_internal_add_qml_module(QuickStudioEffects
    URI "QtQuick.Studio.Effects"
    VERSION "${PROJECT_VERSION}"
    DESIGNER_SUPPORTED
    NO_SYNC_QT
    PAST_MAJOR_VERSIONS 1
    ${qds_qml_extra_args}
    QML_FILES
        FastBlurItem.qml
        GlowItem.qml
        ZoomBlurItem.qml
        RadialBlurItem.qml
        DesaturationItem.qml
        SaturationItem.qml
        DirectionalBlurItem.qml
        ColorOverlayItem.qml
        DropShadowItem.qml
        ColorizeItem.qml
        BrightnessContrastItem.qml
        HueSaturationItem.qml
        MaskedBlurItem.qml
        BlendItem.qml
        OpacityMaskItem.qml
        MaskItem.qml
        RotationItem.qml
        GaussianBlurItem.qml
        GammaAdjustItem.qml
        RecursiveBlurItem.qml
        ThresholdMaskItem.qml
        LevelAdjustItem.qml
        InnerShadowItem.qml
        DisplaceItem.qml
        BlendEffect.qml
        BrightnessContrastEffect.qml
        ColorizeEffect.qml
        ColorOverlayEffect.qml
        DesaturationEffect.qml
        DirectionalBlurEffect.qml
        DisplaceEffect.qml
        DropShadowEffect.qml
        FastBlurEffect.qml
        GammaAdjustEffect.qml
        GaussianBlurEffect.qml
        GlowEffect.qml
        HueSaturationEffect.qml
        InnerShadowEffect.qml
        LevelAdjustEffect.qml
        MaskedBlurEffect.qml
        OpacityMaskEffect.qml
        RadialBlurEffect.qml
        RecursiveBlurEffect.qml
        ThresholdMaskEffect.qml
        ZoomBlurEffect.qml
)

if(QT_FEATURE_quick_designer AND QT_BUILD_SHARED_LIBS)
    add_subdirectory(designer)
endif()

