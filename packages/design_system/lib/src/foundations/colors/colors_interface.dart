import 'package:design_system/src/foundations/colors/colors.dart';
import 'package:flutter/material.dart';

class ForestColorsInterface {
  const ForestColorsInterface({
    this.colorNeutralText = ForestColorsOld.colorNeutralText,
    this.colorNeutralTextLight = ForestColorsOld.colorNeutralTextLight,
    this.colorTextLight = ForestColorsOld.colorTextLight,
    this.colorText = ForestColorsOld.colorText,
    this.colorDisabledText = ForestColorsOld.colorDisabledText,
    this.colorAccentText = ForestColorsOld.colorAccentText,
    this.colorAccentTextHover = ForestColorsOld.colorAccentTextHover,
    this.colorSuccessText = ForestColorsOld.colorSuccessText,
    this.colorSuccessTextLight = ForestColorsOld.colorSuccessTextLight,
    this.colorWarningText = ForestColorsOld.colorWarningText,
    this.colorWarningTextLight = ForestColorsOld.colorWarningTextLight,
    this.colorDangerText = ForestColorsOld.colorDangerText,
    this.colorDangerTextLight = ForestColorsOld.colorDangerTextLight,
    this.colorInfoText = ForestColorsOld.colorInfoText,
    this.colorInfoTextLight = ForestColorsOld.colorInfoTextLight,
    this.colorNeutralIcon = ForestColorsOld.colorNeutralIcon,
    this.colorNeutralIconLight = ForestColorsOld.colorNeutralIconLight,
    this.colorIconLight = ForestColorsOld.colorIconLight,
    this.colorIcon = ForestColorsOld.colorIcon,
    this.colorDisabledIcon = ForestColorsOld.colorDisabledIcon,
    this.colorAccentIcon = ForestColorsOld.colorAccentIcon,
    this.colorAccentIconHover = ForestColorsOld.colorAccentIconHover,
    this.colorSuccessIcon = ForestColorsOld.colorSuccessIcon,
    this.colorSuccessIconLight = ForestColorsOld.colorSuccessIconLight,
    this.colorWarningIcon = ForestColorsOld.colorWarningIcon,
    this.colorWarningIconLight = ForestColorsOld.colorWarningIconLight,
    this.colorDangerIcon = ForestColorsOld.colorDangerIcon,
    this.colorDangerIconLight = ForestColorsOld.colorDangerIconLight,
    this.colorInfoIcon = ForestColorsOld.colorInfoIcon,
    this.colorInfoIconLight = ForestColorsOld.colorInfoIconLight,
    this.colorNeutralBackground = ForestColorsOld.colorNeutralBackground,
    this.colorNeutralBackgroundHover =
        ForestColorsOld.colorNeutralBackgroundHover,
    this.colorNeutralBackgroundActive =
        ForestColorsOld.colorNeutralBackgroundActive,
    this.colorBackground = ForestColorsOld.colorBackground,
    this.colorAccentBackgroundLight =
        ForestColorsOld.colorAccentBackgroundLight,
    this.colorAccentBackgroundHover =
        ForestColorsOld.colorAccentBackgroundHover,
    this.colorAccentBackground = ForestColorsOld.colorAccentBackground,
    this.colorAccentBackgroundActive =
        ForestColorsOld.colorAccentBackgroundActive,
    this.colorComplementBackground = ForestColorsOld.colorComplementBackground,
    this.colorComplementBackgroundLight =
        ForestColorsOld.colorComplementBackgroundLight,
    this.colorComplementBackgroundStrong =
        ForestColorsOld.colorComplementBackgroundStrong,
    this.colorWarningBackgroundLight =
        ForestColorsOld.colorWarningBackgroundLight,
    this.colorWarningBackgroundHover =
        ForestColorsOld.colorWarningBackgroundHover,
    this.colorWarningBackground = ForestColorsOld.colorWarningBackground,
    this.colorWarningBackgroundActive =
        ForestColorsOld.colorWarningBackgroundActive,
    this.colorDangerBackgroundLight =
        ForestColorsOld.colorDangerBackgroundLight,
    this.colorDangerBackgroundHover =
        ForestColorsOld.colorDangerBackgroundHover,
    this.colorDangerBackground = ForestColorsOld.colorDangerBackground,
    this.colorDangerBackgroundActive =
        ForestColorsOld.colorDangerBackgroundActive,
    this.colorInfoBackgroundLight = ForestColorsOld.colorInfoBackgroundLight,
    this.colorInfoBackgroundHover = ForestColorsOld.colorInfoBackgroundHover,
    this.colorInfoBackground = ForestColorsOld.colorInfoBackground,
    this.colorInfoBackgroundActive = ForestColorsOld.colorInfoBackgroundActive,
    this.colorSuccessBackgroundLight =
        ForestColorsOld.colorSuccessBackgroundLight,
    this.colorSuccessBackgroundHover =
        ForestColorsOld.colorSuccessBackgroundHover,
    this.colorSuccessBackground = ForestColorsOld.colorSuccessBackground,
    this.colorSuccessBackgroundActive =
        ForestColorsOld.colorSuccessBackgroundActive,
    this.colorBackgroundDisabled = ForestColorsOld.colorBackgroundDisabled,
    this.colorNeutralBorder = ForestColorsOld.colorNeutralBorder,
    this.colorBorder = ForestColorsOld.colorBorder,
    this.colorBorderFocus = ForestColorsOld.colorBorderFocus,
    this.colorBorderLight = ForestColorsOld.colorBorderLight,
    this.colorAccentBorderFocus = ForestColorsOld.colorAccentBorderFocus,
    this.colorSuccessBorder = ForestColorsOld.colorSuccessBorder,
    this.colorSuccessBorderFocus = ForestColorsOld.colorSuccessBorderFocus,
    this.colorWarningBorder = ForestColorsOld.colorWarningBorder,
    this.colorWarningBorderFocus = ForestColorsOld.colorWarningBorderFocus,
    this.colorDangerBorder = ForestColorsOld.colorDangerBorder,
    this.colorDangerBorderFocus = ForestColorsOld.colorDangerBorderFocus,
    this.colorInfoBorder = ForestColorsOld.colorInfoBorder,
    this.colorInfoBorderFocus = ForestColorsOld.colorInfoBorderFocus,
    this.colorBorderDisabled = ForestColorsOld.colorBorderDisabled,
    this.colorWood0 = ForestColorsOld.colorWood0,
    this.colorWood800 = ForestColorsOld.colorWood800,
    this.colorWood50 = ForestColorsOld.colorWood50,
    this.colorWood100 = ForestColorsOld.colorWood100,
    this.colorWood500 = ForestColorsOld.colorWood500,
    this.colorWood200 = ForestColorsOld.colorWood200,
    this.colorAutumn100 = ForestColorsOld.colorAutumn100,
    this.colorAutumn500 = ForestColorsOld.colorAutumn500,
    this.colorWood300 = ForestColorsOld.colorWood300,
    this.colorWood700 = ForestColorsOld.colorWood700,
    this.colorWood900 = ForestColorsOld.colorWood900,
    this.colorForest500 = ForestColorsOld.colorForest500,
    this.colorForest600 = ForestColorsOld.colorForest600,
    this.colorForest700 = ForestColorsOld.colorForest700,
    this.colorForest800 = ForestColorsOld.colorForest800,
    this.colorForest900 = ForestColorsOld.colorForest900,
    this.colorForest100 = ForestColorsOld.colorForest100,
    this.colorForest400 = ForestColorsOld.colorForest400,
    this.colorRowan100 = ForestColorsOld.colorRowan100,
    this.colorRowan500 = ForestColorsOld.colorRowan500,
    this.colorRowan700 = ForestColorsOld.colorRowan700,
    this.colorCassia500 = ForestColorsOld.colorCassia500,
    this.colorSky500 = ForestColorsOld.colorSky500,
    this.colorWood400 = ForestColorsOld.colorWood400,
    this.colorAutumn900 = ForestColorsOld.colorAutumn900,
    this.colorSky100 = ForestColorsOld.colorSky100,
    this.colorSky700 = ForestColorsOld.colorSky700,
    this.colorSky800 = ForestColorsOld.colorSky800,
    this.colorSky900 = ForestColorsOld.colorSky900,
    this.colorRowan800 = ForestColorsOld.colorRowan800,
    this.colorAutumn700 = ForestColorsOld.colorAutumn700,
    this.colorAutumn800 = ForestColorsOld.colorAutumn800,
    this.colorCassia100 = ForestColorsOld.colorCassia100,
    this.colorCassia700 = ForestColorsOld.colorCassia700,
    this.colorCassia800 = ForestColorsOld.colorCassia800,
    this.colorSky50 = ForestColorsOld.colorSky50,
    this.colorCassia50 = ForestColorsOld.colorCassia50,
    this.colorForest50 = ForestColorsOld.colorForest50,
    this.colorForest200 = ForestColorsOld.colorForest200,
    this.colorRowan900 = ForestColorsOld.colorRowan900,
    this.colorCassia900 = ForestColorsOld.colorCassia900,
  });

  final Color colorNeutralText;
  final Color colorNeutralTextLight;
  final Color colorTextLight;
  final Color colorText;
  final Color colorDisabledText;
  final Color colorAccentText;
  final Color colorAccentTextHover;
  final Color colorSuccessText;
  final Color colorSuccessTextLight;
  final Color colorWarningText;
  final Color colorWarningTextLight;
  final Color colorDangerText;
  final Color colorDangerTextLight;
  final Color colorInfoText;
  final Color colorInfoTextLight;
  final Color colorNeutralIcon;
  final Color colorNeutralIconLight;
  final Color colorIconLight;
  final Color colorIcon;
  final Color colorDisabledIcon;
  final Color colorAccentIcon;
  final Color colorAccentIconHover;
  final Color colorSuccessIcon;
  final Color colorSuccessIconLight;
  final Color colorWarningIcon;
  final Color colorWarningIconLight;
  final Color colorDangerIcon;
  final Color colorDangerIconLight;
  final Color colorInfoIcon;
  final Color colorInfoIconLight;
  final Color colorNeutralBackground;
  final Color colorNeutralBackgroundHover;
  final Color colorNeutralBackgroundActive;
  final Color colorBackground;
  final Color colorAccentBackgroundLight;
  final Color colorAccentBackgroundHover;
  final Color colorAccentBackground;
  final Color colorAccentBackgroundActive;
  final Color colorComplementBackground;
  final Color colorComplementBackgroundLight;
  final Color colorComplementBackgroundStrong;
  final Color colorWarningBackgroundLight;
  final Color colorWarningBackgroundHover;
  final Color colorWarningBackground;
  final Color colorWarningBackgroundActive;
  final Color colorDangerBackgroundLight;
  final Color colorDangerBackgroundHover;
  final Color colorDangerBackground;
  final Color colorDangerBackgroundActive;
  final Color colorInfoBackgroundLight;
  final Color colorInfoBackgroundHover;
  final Color colorInfoBackground;
  final Color colorInfoBackgroundActive;
  final Color colorSuccessBackgroundLight;
  final Color colorSuccessBackgroundHover;
  final Color colorSuccessBackground;
  final Color colorSuccessBackgroundActive;
  final Color colorBackgroundDisabled;
  final Color colorNeutralBorder;
  final Color colorBorder;
  final Color colorBorderFocus;
  final Color colorBorderLight;
  final Color colorAccentBorderFocus;
  final Color colorSuccessBorder;
  final Color colorSuccessBorderFocus;
  final Color colorWarningBorder;
  final Color colorWarningBorderFocus;
  final Color colorDangerBorder;
  final Color colorDangerBorderFocus;
  final Color colorInfoBorder;
  final Color colorInfoBorderFocus;
  final Color colorBorderDisabled;
  final Color colorWood0;
  final Color colorWood50;
  final Color colorWood100;
  final Color colorWood200;
  final Color colorWood300;
  final Color colorWood400;
  final Color colorWood500;
  final Color colorWood700;
  final Color colorWood800;
  final Color colorWood900;
  final Color colorAutumn100;
  final Color colorAutumn500;
  final Color colorAutumn700;
  final Color colorAutumn800;
  final Color colorAutumn900;
  final Color colorForest50;
  final Color colorForest100;
  final Color colorForest200;
  final Color colorForest400;
  final Color colorForest500;
  final Color colorForest600;
  final Color colorForest700;
  final Color colorForest800;
  final Color colorForest900;
  final Color colorRowan100;
  final Color colorRowan500;
  final Color colorRowan700;
  final Color colorRowan800;
  final Color colorRowan900;
  final Color colorCassia50;
  final Color colorCassia100;
  final Color colorCassia500;
  final Color colorCassia700;
  final Color colorCassia800;
  final Color colorCassia900;
  final Color colorSky50;
  final Color colorSky100;
  final Color colorSky500;
  final Color colorSky700;
  final Color colorSky800;
  final Color colorSky900;
}
