class calculations {
  double convertTo(double amount, String? fromMetrics, String? toMetrics) {
    if (fromMetrics == "CM" && toMetrics == "M") {
      double converted = amount / 100;
      return converted;
    }

    if (fromMetrics == "CM" && toMetrics == "KM") {
      double converted = amount / 100000;
      return converted;
    }

    if (fromMetrics == "M" && toMetrics == "CM") {
      double converted = amount * 100;
      return converted;
    }

    if (fromMetrics == "M" && toMetrics == "KM") {
      double converted = amount / 1000;
      return converted;
    }

    if (fromMetrics == "KM" && toMetrics == "CM") {
      double converted = amount * 100000;
      return converted;
    }

    if (fromMetrics == "KM" && toMetrics == "M") {
      double converted = amount * 1000;
      return converted;
    }
    return amount;
  }
}
