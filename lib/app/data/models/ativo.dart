class Ativo {
  Chart? chart;

  Ativo({this.chart});

  Ativo.fromJson(Map<String, dynamic> json) {
    chart = json["chart"] == null ? null : Chart.fromJson(json["chart"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (chart != null) {
      data["chart"] = chart?.toJson();
    }
    return data;
  }
}

class Chart {
  List<Result?>? result;

  Chart({
    this.result,
  });

  Chart.fromJson(Map<String, dynamic> json) {
    result = json["result"] == null
        ? null
        : (json["result"] as List).map((e) => Result.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data["result"] = result?.map((e) => e?.toJson()).toList();
    }
    return data;
  }
}

class Result {
  List<int?>? timestamp;
  Indicators? indicators;

  Result({this.timestamp, this.indicators});

  Result.fromJson(Map<String, dynamic> json) {
    timestamp =
        json["timestamp"] == null ? null : List<int>.from(json["timestamp"]);
    indicators = json["indicators"] == null
        ? null
        : Indicators.fromJson(json["indicators"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (timestamp != null) {
      data["timestamp"] = timestamp;
    }
    if (indicators != null) {
      data["indicators"] = indicators?.toJson();
    }
    return data;
  }
}

class Indicators {
  List<Quote>? quote;

  Indicators({this.quote});

  Indicators.fromJson(Map<String, dynamic> json) {
    quote = json["quote"] == null
        ? null
        : (json["quote"] as List).map((e) => Quote.fromJson(e ?? 0)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (quote != null) {
      data["quote"] = quote?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Quote {
  List<double?>? low;
  List<double?>? open;
  List<double?>? high;
  List<double?>? close;
  List<int?>? volume;

  Quote({this.low, this.open, this.high, this.close, this.volume});

  Quote.fromJson(Map<String, dynamic> json) {
    low = json["low"] == null ? null : List<double?>.from(json["low"] ?? 0.0);
    open =
        json["open"] == null ? null : List<double?>.from(json["open"] ?? 0.0);
    high =
        json["high"] == null ? null : List<double?>.from(json["high"] ?? 0.0);
    close =
        json["close"] == null ? null : List<double?>.from(json["close"] ?? 0.0);
    volume =
        json["volume"] == null ? null : List<int?>.from(json["volume"] ?? 0.0);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (low != null) {
      data["low"] = low;
    }
    if (open != null) {
      data["open"] = open;
    }
    if (high != null) {
      data["high"] = high;
    }
    if (close != null) {
      data["close"] = close;
    }
    if (volume != null) {
      data["volume"] = volume;
    }
    return data;
  }
}
