class Signal {
  final int demand;
  final int capacity;
  final int latency;
  final int risk;
  final int weight;

  const Signal(this.demand, this.capacity, this.latency, this.risk, this.weight);
}

class Policy {
  static const int threshold = 167;
  static const int riskPenalty = 5;
  static const int latencyPenalty = 3;
  static const int weightBonus = 2;

  static int score(Signal signal) =>
      signal.demand * 2 + signal.capacity + signal.weight * weightBonus -
      signal.latency * latencyPenalty - signal.risk * riskPenalty;

  static String classify(Signal signal) =>
      score(signal) >= threshold ? "accept" : "review";
}
