class LogPrint {
  static bool get enableLog => true;

  static get yearLoading {
    if (enableLog) print(">>> loading years <<<");
  }

  static get yearComplate {
    if (enableLog) print(">>> years completed <<<");
  }

  static get brandsLoading {
    if (enableLog) print(">>> loading brands <<<");
  }

  static get brandsComplate {
    if (enableLog) print(">>> brands completed <<<");
  }

  static get modelsLoading {
    if (enableLog) print(">>> loading models <<<");
  }

  static get modelsComplate {
    if (enableLog) print(">>> models completed <<<");
  }
}
