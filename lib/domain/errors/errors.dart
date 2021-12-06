abstract class FailureSearch implements Exception {}

class InvalidText implements FailureSearch {}

class DataSourceError implements FailureSearch {}

class HttpClientError implements FailureSearch {}
