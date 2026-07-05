import 'package:flutter/material.dart';

import 'taxa_theme_tokens.dart';

extension TaxaThemeContext on BuildContext {
  TaxaThemeColors get taxaColors {
    return Theme.of(this).extension<TaxaThemeColors>()!;
  }

  TaxaSpacing get taxaSpacing {
    return Theme.of(this).extension<TaxaSpacing>()!;
  }

  TaxaRadii get taxaRadii {
    return Theme.of(this).extension<TaxaRadii>()!;
  }

  TaxaMotionTokens get taxaMotion {
    return Theme.of(this).extension<TaxaMotionTokens>()!;
  }

  bool get taxaReduceMotion {
    return MediaQuery.of(this).disableAnimations;
  }
}
